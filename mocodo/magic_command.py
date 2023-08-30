import argparse
import os
import re
import shlex
import warnings
from pathlib import Path
from subprocess import PIPE, Popen
import importlib

import pkg_resources
from IPython import get_ipython
from IPython.core.magic import Magics, line_cell_magic, magics_class
from IPython.display import HTML, Image, SVG, display, Markdown, Code
from base64 import b64encode

try:
    MOCODO_VERSION = pkg_resources.get_distribution("mocodo").version
except pkg_resources.DistributionNotFound:
    MOCODO_VERSION = "(unknown version)"  # For tests during CI


IPYTHON = get_ipython()

def update_cell(content):
    IPYTHON.set_next_input(content, replace=True)

PARAM_TEMPLATE = '''\
# You may edit and run the following lines
import json, pathlib
params = """
{stdoutdata}
"""
try:
    json.loads(params)
except:
    raise RuntimeError("Invalid JSON. Check your syntax on https://jsonlint.com.")
pathlib.Path("{output_dir}/params.json").write_text(params.strip(), encoding="utf8")
'''

def display_converted_file(path):
    extension=path.suffix[1:]
    if extension == "svg":
        # Fix a maximum width for SVG images:
        # https://stackoverflow.com/questions/51452569/how-to-resize-rescale-a-svg-graphic-in-an-ipython-jupyter-notebook
        svg = b64encode(path.read_bytes()).decode("utf8")
        display(HTML(f'<img max-width="100%" src="data:image/svg+xml;base64,{svg}">'))
    elif extension == "md":
        display(Markdown(filename=path))
    elif extension == "png":
        display(Image(filename=path, unconfined=False))
    elif extension == "html":
        text = path.read_text()
        text = re.sub('<!-- TO_BE_DELETED_BY_MOCODO_MAGIC -->.+\n', "", text)
        display(HTML(text))
    elif extension == "tex":
        display(Code(filename=path, language="latex"))
    elif extension == "tsv":
        try:
            df = importlib.import_module("pandas").read_csv(path, sep="\t", header=0, index_col=False)
            df = df.style.set_properties(**{'text-align': 'left'}).set_table_styles([ dict(selector='th', props=[('text-align', 'left')] ) ])
            display(df)
        except ImportError:
            display(Markdown(f"```\n{path.read_text()}\n```"))
    else:
        display(Markdown(f"```{extension}\n{path.read_text()}\n```"))

@magics_class
class MocodoMagics(Magics):
    @staticmethod
    @line_cell_magic
    def mocodo(line, cell=""):
        """
        Mocodo IPython magic extension

        Magic methods:
            %mocodo [command line options]
            %%mocodo [command line options]
            < MCD ... >

        Usage:
            %load_ext mocodo
        """

        parser = argparse.ArgumentParser(add_help=False)
        parser.add_argument("--no_mcd", "--quiet", "--mute", action="store_true")
        parser.add_argument("--input")
        parser.add_argument("--output_dir")
        (args, remaining_args) = parser.parse_known_args(shlex.split(line))

        if Path.cwd().name != "mocodo_notebook":
            Path("mocodo_notebook").mkdir(parents=True, exist_ok=True)
            os.chdir("mocodo_notebook")

        if not args.input:
            input_path = Path.cwd() / "sandbox.mcd"
            input_path.write_text(cell, encoding="utf8")
        else:
            input_path = Path(args.input)
            if not input_path.suffix:
                input_path = input_path.with_suffix(".mcd")

        if not args.output_dir:
            output_dir = Path.cwd()
        else:
            output_dir = Path(args.output_dir)
            try:
                output_dir.mkdir(parents=True, exist_ok=True)
            except OSError:
                if not output_dir.is_dir():
                    raise
        output_path_radical = output_dir / input_path.stem

        remaining_args.extend([  # may override user's provided options
            "--input", str(input_path),
            "--output_dir", str(output_dir),
        ]) # may override user's provided options

        process = Popen(["mocodo"] + remaining_args, stdin=PIPE, stdout=PIPE, stderr=PIPE)
        stdoutdata, stderrdata = process.communicate()
        try:
            stdoutdata = stdoutdata.decode("utf8")
            stderrdata = stderrdata.decode("utf8")
        except:
            pass
        status = process.wait()
        if status != 0 or stderrdata:
            warnings.formatwarning = lambda x, *args, **kargs : str(x)
            warnings.warn(stderrdata)
            return
        
        if "--help" in remaining_args:
            print(stdoutdata)
            return
        
        if "--print_params" in remaining_args:
            update_cell(PARAM_TEMPLATE.format(stdoutdata=stdoutdata, output_dir=output_dir))
            return
        
        has_explicit_conversion = "--convert" in remaining_args or "-c" in remaining_args
        has_rewriting = "--rewrite" in remaining_args or "-r" in remaining_args or "-R" in remaining_args
        must_replace = "-R" in remaining_args

        if not args.no_mcd and not must_replace and not has_explicit_conversion:
            svg_path = output_path_radical.with_suffix(".svg")
            if svg_path.is_file() and input_path.stat().st_mtime <= svg_path.stat().st_mtime:
                display(SVG(filename=svg_path))
        
        if has_explicit_conversion or "--mld" in remaining_args:
            mute_path = output_dir / "mute_converting"
            if mute_path.is_file():
                mute_path.unlink()
            else:
                convert_log_files = output_dir / "convert.log"
                if convert_log_files.is_file():
                    for filename in convert_log_files.read_text().splitlines():
                        display_converted_file(Path(filename))
                    convert_log_files.unlink()
        
        if has_rewriting:
            rewritten_path = Path(f"{output_path_radical}_rewritten.mcd")
            updated_source = rewritten_path.read_text().rstrip()
            if not updated_source.startswith("%%mocodo"):
                updated_source = f"%%mocodo\n{updated_source}"
            rewritten_path.unlink()
            if must_replace:
                update_cell(updated_source)
            mute_path = output_dir / "mute_rewriting"
            if mute_path.is_file():
                mute_path.unlink()
            else:
                print(updated_source)


try:
    IPYTHON.register_magics(MocodoMagics)
except AttributeError:
    pass # necessary for launching the tests
else:
    print(f"Mocodo {MOCODO_VERSION} loaded.")


import time
import unittest
import gettext
from pathlib import Path
import shutil
from mocodo.argument_parser import parsed_arguments
from mocodo.common import Common
from mocodo.convert.read_template import read_template
from mocodo.font_metrics import font_metrics_factory
from mocodo.mcd import Mcd
from mocodo.convert.relations import Relations
from mocodo.mocodo_error import MocodoError
import random
import re
from mocodo.convert import (
    _chen as chen,
    _crow as crow,
)
from mocodo.rewrite import (
    op_tk,
    _explode as explode,
    _drain as drain,
    _split as split,
)
from mocodo.rewrite._arrange_bb import arrange
from mocodo.mcd_to_svg import main as dump_mcd_to_svg
import os

gettext.NullTranslations().install()

TEMPLATE_DIR = Path("mocodo/resources/relation_templates/")
ZOO_DIR = Path("test/zoo")

def save(path, text):
    text = re.sub(r"^.+? Generated by Mocodo.+\n", "", text)
    Path(path).write_text(text)


def main():

    def dump_static_svg(mcd, mcd_path):
        output_name = params["output_name"] = str(mcd_path)[:-4]
        Path(f"{output_name}_geo.json").unlink(missing_ok=True)
        dump_mcd_to_svg(mcd, common)
        if Path(f"{output_name}_static.svg").is_file():
            Path(f"{output_name}.svg").unlink()
            Path(f"{output_name}_static.svg").rename(f"{output_name}.svg")
    
    def convert_dot_to_svg(dot_path):
        svg_path = dot_path.with_suffix(".svg")
        os.system(f"dot -Tsvg {dot_path} -o {svg_path}")
        return svg_path

    def may_dump_rewritten_version(subfolder, source, stem, operation_name, subargs=None):
        try:
            module = globals()[operation_name] # e.g., explode, drain, ...
        except KeyError:
            module = op_tk
        result = module.run(source, subopt=operation_name, subargs=subargs, params=params).rstrip()
        suffix = ",".join(f"{k}={v}" if v else k for (k, v) in subargs.items())
        if suffix:
            suffix = f"_{suffix}"
        new_mcd_path = subfolder / f"{stem}_rw_{operation_name}{suffix}.mcd"
        if result == source:
            result = "% same as the source file"
            save(new_mcd_path, result + "\n")
            return
        for path in subfolder.glob(f"{stem}_rw_{operation_name}*.mcd"):
            if result == path.read_text():
                result = f"% same as {path.name}"
                save(new_mcd_path, result + "\n")
                return
        mcd = Mcd(result, get_font_metrics, **params)
        if operation_name in ("explode", "split"):
            random.seed(42)
            rearrangement = arrange(mcd, {})
            mcd.set_layout(**rearrangement)
            result = mcd.get_clauses()
            mcd = Mcd(result, get_font_metrics, **params)
        save(new_mcd_path, result + "\n")
        dump_static_svg(mcd, new_mcd_path)


    templates = []
    for template_path in TEMPLATE_DIR.glob("*.json"):
        if re.match(r"(html|markdown|latex|text)(=0|=1|=2|)$", template_path.stem):
            continue
        templates.append(read_template(template_path.stem, TEMPLATE_DIR))

    params = parsed_arguments()
    params["guess_title"] = False
    params["id_gutter_visibility"] = "auto"
    params["id_gutter_strong_string"] = "ID"
    params["id_gutter_weak_string"] = "id"
    params["id_gutter_alts"] = dict(zip("123456789", "123456789"))
    params["guess_title"] = False
    params["disambiguation"] = "notes"
    params["language"] = "fr"
    params["seed"] = 42
    params["df"] = "DF"
    common = Common(params)
    get_font_metrics = font_metrics_factory(params)
    for path in ZOO_DIR.glob("*/*"):
        if path.is_dir():
            shutil.rmtree(path, ignore_errors=True) # suppress all subfolders
        elif not path.name.startswith("_"):
            path.unlink() # suppress all files except those starting with "_"
    for source_path in sorted(ZOO_DIR.glob("*/*.mcd")):
        print(f"Processing {source_path.name}")
        params["title"] = source_path.parent.name

        source = source_path.read_text().rstrip()
        params["disambiguation"] = "numbers_only" if source.startswith("% numbers_only") else "notes"

        # Create some rewritten versions of the source file.
        subfolder = Path(source_path.parent / "rewritten")
        subfolder.mkdir(exist_ok=True)
        may_dump_rewritten_version(subfolder, source, source_path.stem[1:], "explode", {"arity": 2, "weak": ""})
        may_dump_rewritten_version(subfolder, source, source_path.stem[1:], "explode", {"arity": 2.5, "weak": ""})
        may_dump_rewritten_version(subfolder, source, source_path.stem[1:], "explode", {"arity": 3, "weak": ""})
        may_dump_rewritten_version(subfolder, source, source_path.stem[1:], "explode", {"arity": 2})
        may_dump_rewritten_version(subfolder, source, source_path.stem[1:], "explode", {"arity": 2.5})
        may_dump_rewritten_version(subfolder, source, source_path.stem[1:], "explode", {"arity": 3})
        may_dump_rewritten_version(subfolder, source, source_path.stem[1:], "drain", {})
        may_dump_rewritten_version(subfolder, source, source_path.stem[1:], "split", {})
        may_dump_rewritten_version(subfolder, source, source_path.stem[1:], "df_arrows", {"create": "across"})

        mcd = Mcd(source, get_font_metrics, **params)

        # Create some converted files.
        subfolder = Path(source_path.parent / "exported")
        subfolder.mkdir(exist_ok=True)

        text = chen.run(source, {}, common, testing=True).replace("    ", "") + "\n"
        save(subfolder / f"{source_path.stem[1:]}_erd_chen.txt", text)

        text = chen.run(source, {"attrs": 1}, common)["text"]
        save(subfolder / f"{source_path.stem[1:]}_erd_chen.gv", text)
        convert_dot_to_svg(subfolder / f"{source_path.stem[1:]}_erd_chen.gv")

        try:
            text = crow.run(source, {"mmd": True}, common)["text"]
            save(subfolder / f"{source_path.stem[1:]}_erd_crow.mmd", text)

            text = crow.run(source, {"gv": True}, common)["text"]
            save(subfolder / f"{source_path.stem[1:]}_erd_crow.gv", text)
            convert_dot_to_svg(subfolder / f"{source_path.stem[1:]}_erd_crow.gv")
        except AssertionError:
            save(subfolder / f"{source_path.stem[1:]}_erd_crow.mmd", "Not implemented for n-ary associations.")

        # Create the non-sql output files.
        subfolder = Path(source_path.parent / "mld")
        subfolder.mkdir(exist_ok=True)
        for template in templates:
            if template["extension"] == "sql":
                continue
            relations = Relations(mcd, params)
            output = relations.get_text(template).strip() + "\n"
            output_path = subfolder / f"{source_path.stem[1:]}{template['stem_suffix']}.{template['extension']}"
            save(output_path, output)
            if template["extension"] == "gv":
                convert_dot_to_svg(output_path)
            elif template["extension"] == "mcd":
                try:
                    relational_diagram_mcd = Mcd(source, get_font_metrics, **params)
                except MocodoError as e:
                    assert e.args[0].startswith("Mocodo Err.4") # Empty MCD
                else:
                    dump_static_svg(relational_diagram_mcd, output_path)

        # Create the svg output file.
        dump_static_svg(mcd, source_path.parent / f"{source_path.stem[1:]}.mcd")

        # Create the sql output files. Warning: modifies source.
        subfolder = Path(source_path.parent / "ddl")
        subfolder.mkdir(exist_ok=True)
        source = op_tk.run(source, "types", {"guess": ""}, params)
        source = op_tk.run(source, "sql", dict.fromkeys(["ascii", "snake", "lower"]), params)
        source = op_tk.run(source, "boxes", dict.fromkeys(["upper"]), params)
        mcd = Mcd(source, get_font_metrics, **params)
        for template in templates:
            if template["extension"] != "sql":
                continue
            relations = Relations(mcd, params)
            output = relations.get_text(template).strip() + "\n"
            save(subfolder / f"{source_path.stem[1:]}{template['stem_suffix']}.sql", output)

def test_launch_snapshot(capsys):
    with capsys.disabled():
        print("\nCancel the long snapshot calculation by pressing Ctrl+C within 5 seconds", end="")
        for _ in range(5):
            time.sleep(1)
            print(".", end="", flush=True)
        print("\nLet's go!")
        main()

if __name__ == "__main__":
    main()

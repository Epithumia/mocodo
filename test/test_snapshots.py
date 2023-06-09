import os
from pathlib import Path

__import__("sys").path[0:0] = ["mocodo"]
from mocodo.argument_parser import parsed_arguments
from mocodo.common import Common
from mocodo.font_metrics import font_metrics_factory
from mocodo.mcd import Mcd
from mocodo.mcd_to_svg import main as mcd_to_svg
from mocodo.read_template import read_template
from mocodo.relations import *

TEMPLATE_DIR = Path("mocodo") / "resources" / "relation_templates"

minimal_template = read_template("text", TEMPLATE_DIR)
debug_template = read_template("debug", TEMPLATE_DIR)

source = """
%%mocodo --mld --relations mysql html_verbose latex text sqlite

:
    PEUT COHABITER AVEC, 0N ESPÈCE, 0N [commensale] ESPÈCE: nb. max. commensaux
:
:
:

PEUT VIVRE DANS, 1N ESPÈCE, 1N ENCLOS: nb. max. congénères
ESPÈCE: code espèce, 1_nom latin, nom vernaculaire
  DF, 0N ESPÈCE, _11 ANIMAL
:
  CARNIVORE: quantité viande

ENCLOS: num. enclos
      OCCUPE, 1N ANIMAL, /1N PÉRIODE, 1N ENCLOS
  ANIMAL: 3_nom, sexe, _date naissance, 3_date décès
  /\\ ANIMAL <= CARNIVORE, HERBIVORE: type alimentation
:

:
      PÉRIODE: date début, _date fin
    A MÈRE, 01 ANIMAL, 0N> [mère] ANIMAL
:
  HERBIVORE: plante préférée

      (   ) [For testing purpose] --> ENCLOS, ..PÉRIODE, --OCCUPE: ENCLOS, PÉRIODE
"""

snapshot_dir = Path("test/snapshots")
params = parsed_arguments()
params["title"] = "Untitled"
params["guess_title"] = False
params["output_name"] = f"{snapshot_dir}/snapshot"
common = Common(params)
get_font_metrics = font_metrics_factory(params)

result = []
result.append("# Snapshots")
result.append(f"## Source\n\n```{source}```\n")
mcd = Mcd(source, get_font_metrics, **params)
try:
    os.remove(snapshot_dir / "snapshot_geo.json")
except:
    pass
result.append(f"## SVG output\n")
mcd_to_svg(mcd, common)
result.append(f"### Static\n")
result.append("![](snapshot_static.svg)\n")
result.append(f"### Dynamic\n")
result.append("![](snapshot.svg)\n")

result.append(f"## Relational output\n")
relations = Relations(mcd, params)
for relation_path in sorted(Path("mocodo/resources/relation_templates/").glob("*.json")):
    template = read_template(relation_path.stem, TEMPLATE_DIR)
    output = relations.get_text(template).strip()
    result.append(f"### `{relation_path.name}`\n\n```{template.get('highlight', '')}\n{output}\n```\n")

result.append("## Inheritance stress test\n")

result.append("### External associations\n")

source = """
    SUSCIPIT: orci, lorem
    RHONCUS, 1N TRISTIS, 11 SUSCIPIT
    :
    :
    SODALES: convallis, ipsum
    VITAE, 11 QUAM, 1N SODALES
    QUAM: cras, sed

    CONSEQUAT: fermentum, dederit
    ELIT, 11 TRISTIS, 1N CONSEQUAT
    TRISTIS: magna, vestibulum
    /T\\ TRISTIS {arrow} SODALES, NEC, LACUS: type
    NEC: pulvinar, audis
    MOLLIS, 1N CURABITUR, 11 NEC
    CURABITUR: gravida, amor

    DIGNISSIM: tellus, terra
    ALIQUET, 1N TRISTIS, 1N DIGNISSIM
    :
    :
    LACUS: tempor, fugit
    ULTRICES, 1N LIBERO, 1N LACUS
    LIBERO: posuere, lacrima
"""
result.append(f"```{source}```\n")
for arrow in ("<=", "<-", "->", "=>"):
    c = source.format(arrow=arrow)
    result.append(f"#### Arrow `{arrow}`")
    try:
        t = Relations(Mcd(c, params), params)
        result.append(f"```\n{t.get_text(minimal_template)}\n```\n")
        result.append(t.get_text(debug_template))
    except MocodoError as e:
        print(e)

result.append("### Internal associations\n")

source = """
:
MOLLIS, 1N [via mollis] LACUS, 11 NEC
NEC: pulvinar, audis
:

LACUS: tempor, fugit
/XT\\ TRISTIS {arrow} SODALES, NEC, LACUS: type
TRISTIS: magna, vestibulum
VITAE, 11 NEC, 1N [via vitae] SODALES

:
ULTRICES, 1N [sodales] SODALES, 1N [lacus] LACUS
SODALES: convallis, ipsum
:
"""
result.append(f"```{source}```\n")
for arrow in ("<=", "<-", "->", "=>"):
    c = source.format(arrow=arrow)
    result.append(f"#### Arrow `{arrow}`")
    try:
        t = Relations(Mcd(c, params), params)
        result.append(f"```\n{t.get_text(minimal_template)}\n```\n")
        result.append(t.get_text(debug_template))
    except KeyError as e:
        print(e)

Path(f"{snapshot_dir}/snapshot.md").write_text("\n".join(result))

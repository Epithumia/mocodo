from ..parse_mcd import Visitor
from ..tools.parser_tools import parse_source, reconstruct_source, first_child
from ..tools.various import invert_dict


def fix_card(
    card,
    fixes=invert_dict(
        {
            "01": ["O1", "o1", "10", "1O", "1o", "Ol", "ol", "l0", "lO", "lo"],
            "0N": ["ON", "oN", "NO", "No", "N0"],
            "0n": ["On", "on", "no", "nO", "n0"],
            "1N": ["N1", "Nl"],
            "1n": ["n1", "nl"],
        }
    ),
):
    return fixes.get(card, card)

class DfInference(Visitor):

    def __init__(self, df_label):
        self.df_label = df_label

    def assoc_clause(self, tree):
        assoc_name = first_child(tree, "assoc_name_def").children[0]
        if assoc_name == self.df_label:
            return
        cards = []
        legs = list(tree.find_data("assoc_leg"))
        for leg in legs:
            card_prefix = first_child(leg, "card_prefix")
            if card_prefix == "/":
                return
            card = first_child(leg, "card")
            cards.append(card)
        if "11" in cards:
            assoc_name.value = self.df_label

def infer_dfs(source, df_label):
    tree = parse_source(source)
    visitor = DfInference(df_label)
    visitor.visit(tree)
    return reconstruct_source(tree)


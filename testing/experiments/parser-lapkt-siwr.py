#! /usr/bin/env python

from lab.parser import Parser


def try_delete(map, key):
    try:
        del map[key]
    except KeyError:
        pass


def post_process(content, props):
    """ Removes values if the instance was not solved. """
    if not int("cost" in props):
        try_delete(props, "total_time")
        try_delete(props, "cost")
        try_delete(props, "generated")
        try_delete(props, "expanded")
        try_delete(props, "maximum_effective_width")
        try_delete(props, "average_effective_width")


def not_i_reachable(content, props):
    if ";; NOT I-REACHABLE ;;" in content:
        props["not_i_reachable"] = 1
    else:
        props["not_i_reachable"] = 0

def main():
    parser = Parser()
    parser.add_pattern("expanded", r"Nodes expanded during search: (\d+)\n", type=int)
    parser.add_pattern("generated", r"Nodes generated during search: (\d+)\n", type=int)
    parser.add_pattern("maximum_effective_width", r"Max ef. width: (\d+)\n", type=int)
    parser.add_pattern("average_effective_width", r"Average ef. width: (.+)\n", type=float)
    parser.add_function(not_i_reachable)
    parser.add_function(post_process)
    parser.parse()

if __name__ == "__main__":
    main()

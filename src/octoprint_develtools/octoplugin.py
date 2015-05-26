# coding=utf-8
from __future__ import absolute_import

__author__ = "Gina Häußge <osd@foosel.net>"
__license__ = 'GNU Affero General Public License http://www.gnu.org/licenses/agpl.html'
__copyright__ = "Copyright (C) 2015 The OctoPrint Project - Released under terms of the AGPLv3 License"

import argparse

def create_command(args):
	from cookiecutter.main import cookiecutter
	cookiecutter(args.repo, extra_context=dict(plugin_name=args.name))

def set_config(args):
	import os
	from cookiecutter.config import get_user_config
	current_config = get_user_config()

	current_config["default_context"][args.key] = args.value

	import yaml
	config_path = os.path.expanduser("~/.cookiecutterrc")
	with open(config_path, "w+") as file_handle:
		yaml.safe_dump(current_config, stream=file_handle, allow_unicode=True)

def main():
	parser = argparse.ArgumentParser()

	subparsers = parser.add_subparsers(help="Commands", dest="command")

	# create command
	subparser = subparsers.add_parser("create", help="Creates the basic structure of a new plugin")
	subparser.add_argument("--repo", default="https://github.com/OctoPrint/cookiecutter-octoprint-plugin", help="Alternative location of cookiecutter template")
	subparser.add_argument("--no-input", action="store_true", help="Don't ask for input and use only default values")
	subparser.add_argument("name", default="OctoPrint-Skeleton", help="The name of the new plugin")
	subparser.set_defaults(func=create_command)

	# config-set command
	subparser = subparsers.add_parser("config-set", help="Set a configuration key in ~/.cookiecutterrc to use for default values during create")
	subparser.add_argument("key", help="The key to set")
	subparser.add_argument("value", help="The value to set")
	subparser.set_defaults(func=set_config)

	args = parser.parse_args()

	args.func(args)

if __name__ == "__main__":
	main()
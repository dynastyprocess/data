# DynastyProcess.com Data Repository
This repository contains resources and data for the purpose of supporting apps and developers, and is updated via Github Actions on a weekly basis.

## Status
[![weekly-playerids](https://github.com/dynastyprocess/db/actions/workflows/weekly-playerids.yml/badge.svg)](https://github.com/dynastyprocess/db/actions/workflows/weekly-playerids.yml)
[![weekly-fantasypros](https://github.com/dynastyprocess/db/actions/workflows/weekly-fantasypros.yml/badge.svg)](https://github.com/dynastyprocess/db/actions/workflows/weekly-fantasypros.yml) 
[![weekly-playervalues](https://github.com/dynastyprocess/db/actions/workflows/weekly-playervalues.yml/badge.svg)](https://github.com/dynastyprocess/db/actions/workflows/weekly-playervalues.yml) 

## Description
The main files available are: 

- db_playerids.csv
- db_fpecr.csv.gz and db_fpecr.parquet - use parquet for python/R, it's faster/better! 
- values.csv (and sibling files values-players.csv and values-picks.csv)

**Please note: the old `db_fpecr.csv` file has been gzipped to the csv.gz file due to GitHub size restrictions.**

## Archived

The old database.csv was getting a little unwieldy (80+ columns) so it's been broken down into smaller, more specific pieces.

Other dataframes may be available (and if not, we can direct to potential sources of the data - please open an issue!)

A number of older files were moved into the `archives/` folder and are out of date. 

## Contributing

Many hands make light work, especially when maintaining open data! Here are some ways you can contribute to this project:

- You can [open an issue](https://github.com/DynastyProcess/data/issues/new/choose) if you'd like to request specific data or report a bug/error. 

- While the main files (as listed above) are maintained by an automated script, you can also make pull requests to supporting files (i.e. `missing_playerids.csv`) which are used to help fill in any gaps.

- You can [sponsor this project by donating to help with server costs](https://github.com/sponsors/tanho63)!

Please note that this project is released with a [Contributor Code of Conduct](https://github.com/DynastyProcess/data/blob/master/CODE_OF_CONDUCT.md) - by participating, you agree to abide by these terms.

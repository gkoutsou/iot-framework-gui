################################################################################
###                       Makefile for Project CS 2013                       ###
################################################################################
### Variable assignment
################################################################################


################################################################################
### Dependency rules
### Do NOT touch this section!
### The commands in this sections should not be used in general, but can be used
### if there is need for it
################################################################################
### Command: make
### Runs the project, excluding the dependencies.
all: 
	rails s

get_libs:
	$(info = = = = = = = = = = = I M P O R T A N T !!! = = = = = = = = = = =)
	$(info Before running this command, you need to set the bash shell to be)
	$(info run as a login shell. This is done at the following location:)
	$(info 'Edit' -> 'Profile Preferences' -> 'Title and command' -> 'Command')
	$(info You need to tick the box that says 'Run command as a login shell')
	$(info You also need to restart your bash console after that is done.)
	$(info If that is not done, this script will fail)
	$(info = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =)
	$(info )
	chmod +x install.sh
	@./install.sh

clean_emacs_vsn_files:
	rm -rf *~
################################################################################


################################################################################
### Command rules
### This section contains commands that can be used.
### This section can be edited if needed
################################################################################

### Command: make install
### Downloads all dependencies and builds the entire project
install: get_libs

### Command: make run
### Downloads all depenedencies, bulds entire project and runs the project.
run:
	rails s


### Command: make test
### Runs all test cases.
test: 
	@-mkdir test-results
	bundle exec rake db:migrate RAILS_ENV=test && bundle exec rspec spec

### Command: make docs
### Genereats all of the documentation files
docs:


### Command: make clean
### Cleans the directory of the following things:
### * Emacs versioning files.
### * All erlang .beam files, including 'ebin' folder
clean: clean_emacs_vsn_files
	rm -rf test-results/

### Command: make clean_docs
### Cleans the directory of the following things:
### * All the documentation files except 'overview.edoc'
clean_docs:
	find doc/ -type f -not -name 'overview.edoc' | xargs rm

### Command: make help
### Prints an explanation of the commands in this Makefile
help:
	@echo "###################################################################"
	@echo "Commands:"
	@echo ""
	@echo "'make'"
	@echo  "Runs ruby on rails. Does NOT download dependencies"
	@echo ""
	@echo "'make install'"
	@echo "Downloads and compiles all dependencies"
	@echo ""
	@echo "'make run'"
	@echo "Runs ruby on rails."
	@echo ""
	@echo "'make test'"
	@echo "Run all of the test cases for the project"
	@echo ""
	@echo "'make docs'"
	@echo "Generates documentation for the project"
	@echo ""
	@echo "'make clean'"
	@echo "Cleans all the project test results"
	@echo ""
	@echo "'make clean_docs'"
	@echo "Cleans all of the documentation files"
	@echo ""
	@echo "'make help'"
	@echo "Prints an explanation of the commands in this Makefile"
	@echo "###################################################################"

.PHONY: all install
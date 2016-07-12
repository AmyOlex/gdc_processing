SHELL=/bin/bash

#  Created by alolex on 3/11/15.
#  UPDATE: 11/17/15 to also make an ALIGNMENT folder for projects that are starting from a FASTQ file and have to be aligned first.
#  11/17/15 I also included a new folder called MAPFILES that will hold all the MAPFILES needed to process the fastq and bam files and other files.
#  A makefile to initilize the directory structure for a new TCGA cohort.
#  This file MUST be run from the top level directory where CGHub downloaded the BAM files to.
#  UPDATE: 7/12/16 Changed this file to work with the new Genomic Data Commons file download format using the API.
#  File no longer need to be preprocessed and I don't need MAPFILES anymore, only MANIFEST files from GDC API.

all: QC LOGS MANIFESTS

QC:
	if [ ! -d $@ ] ; \
	then \
		mkdir $@ ; \
		if [ $$? -gt 0 ]; \
		then \
			echo "Error: $@ could not be created."; \
			exit 1; \
		else \
			echo "Created $@ folder."; \
		fi ; \
	else \
		echo "$@ folder already exists."; \
	fi ; \
	cd $@ ; \
	if [ ! -d "FASTQC" ] ; \
	then \
		mkdir "FASTQC" ; \
		if [ $$? -gt 0 ]; \
		then \
			echo "Error: $@/FASTQC could not be created."; \
			exit 1; \
		else \
			echo "Created $@/FASTQC folder."; \
		fi ; \
	else \
		echo "$@/FASTQC folder already exists."; \
	fi ; \
	if [ ! -d "FLAGSTAT" ] ; \
	then \
		mkdir "FLAGSTAT" ; \
		if [ $$? -gt 0 ]; \
		then \
			echo "Error: $@/FLAGSTAT could not be created."; \
			exit 1; \
		else \
			echo "Created $@/FLAGSTAT folder."; \
		fi ; \
	else \
		echo "$@/FLAGSTAT folder already exists."; \
	fi ; \
	cd ../ ;

LOGS: 
	if [ ! -d $@ ] ; \
	then \
		mkdir $@ ; \
		if [ $$? -gt 0 ]; \
		then \
			echo "Error: $@ could not be created."; \
			exit 1; \
		else \
			echo "Created $@ folder."; \
			exit 0; \
		fi ; \
	else \
		echo "$@ folder already exists."; \
		exit 0; \
	fi ;

MANIFESTS:
	if [ ! -d $@ ] ; \
	then \
		mkdir $@ ; \
		if [ $$? -gt 0 ]; \
		then \
			echo "Error: $@ could not be created."; \
			exit 1; \
		else \
			echo "Created $@ folder."; \
			exit 0; \
		fi ; \
	else \
		echo "$@ folder already exists."; \
		exit 0; \
	fi ;

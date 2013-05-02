#!/bin/bash

path="./"
filename="Ellly.blend"
file='http://s3.amazonaws.com/MakersMap/jobs/cad_files/000/000/006/original/01-30_mouthpiece_v2-1_20130502-17926-4x5v8e-0.stl'
description="Test of the api with a simple model"
token_api="ff00ff"
title="Uber Glasses"
tags="test collada glasses"
private=1
password="Tr0b4dor&3"

curl -k -X POST -F "fileModel=@${file}" -F "filenameModel=${filename}" -F "title=${title}" -F "description=${description}" -F "tags=${tags}" -F "private=${private}" -F "password=${password}" -F "token=${token_api}" https://api.sketchfab.com/v1/models
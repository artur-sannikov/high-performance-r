all:
	$(SLIDEFACTORY) pages --with-pdf \
	    --info_content '$(shell ./info_content.sh | sed s:\":\\\":g)' about.yml _output

deploy:
	rclone copy -L --progress _output/ allas:high-performance-r/

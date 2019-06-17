DITAA_SRCS = $(wildcard *.ditaa)
PNG_TARGETS = $(DITAA_SRCS:.ditaa=.png)

%.png: %.ditaa
	ditaa -o $<

all: $(PNG_TARGETS)

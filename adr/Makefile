DITAA_SRCS = $(wildcard *.ditaa)
DITAA_TARGETS = $(DITAA_SRCS:.ditaa=.png)
MERMAID_SRCS = $(wildcard *.mmd)
MERMAID_TARGETS = $(MERMAID_SRCS:.mmd=.png)

%.png: %.ditaa
	ditaa -o $<

%.png: %.mmd
	mmdc -i $< -o $@ -b transparent

all: $(DITAA_TARGETS) $(MERMAID_TARGETS)

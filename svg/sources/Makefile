# Define directories
POLY_OBJDIR:=$(OBJDIR)/examples
AUTODIRS:=$(POLY_OBJDIR)

# Define source files and object files
CFILES:=${shell find ${CURDIR} -name "*.cpp" -print}
OFILES:=$(patsubst %.cpp,%.o,$(CFILES))
OFILES:=$(notdir $(OFILES))
OFILES:=$(addprefix $(POLY_OBJDIR)/,$(OFILES))
OUTFILES:=$(patsubst %.cpp,%,$(CFILES))
OUTFILES:=$(notdir $(OUTFILES))
OUTFILES:=$(addprefix $(BINDIR)/,$(OUTFILES))
CPPFLAGS:=$(CPPFLAGS)
LDFLAGS:=$(LDFLAGS) -L$(BINDIR) -lsvg2
# Define sub-directories
VPATH:=$(dir $(CFILES)) $(INCDIR)

.PHONY: all clean mrproper poly_pre poly_post directories directories_pre directories_post

all: directories poly_pre $(OUTFILES) poly_post

poly_pre:
	@$(ECHO) "-- Building poly --"

poly_post: $(OUTFILES)
	@$(ECHO) "-- poly done --"

$(BINDIR)/%: %.cpp $(LIBSVG2_AFILE)
	$(CROSS_COMPILE)$(CXX) $(CPPFLAGS) $(addprefix -I,$(INCDIR)) -c $< -o $(POLY_OBJDIR)/$(notdir $@).o
	$(CROSS_COMPILE)$(CXX) $(POLY_OBJDIR)/$(notdir $@).o $(LDFLAGS) -o $@


clean:
	@$(RM) $(POLY_OBJDIR)

mrproper: clean
	@$(RM) $(OUTFILES)

directories: directories_pre $(AUTODIRS) directories_post

directories_pre:
	@$(ECHO) -- Checking directories --

directories_post:
	@$(ECHO) -- directories done --

$(AUTODIRS):
	@$(ECHO) -n $(PROMPT)
	$(MKDIR) -p $@

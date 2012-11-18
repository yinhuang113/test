# Define directories
TEST_OBJDIR:=$(OBJDIR)/tests
POLY_OBJDIR:=$(OBJDIR)/poly
AUTODIRS:=$(TEST_OBJDIR)

# Define source files and object files
CFILES:=${shell find ${CURDIR} -name "*.cpp" -print}
OFILES:=$(patsubst %.cpp,%.o,$(CFILES))
OFILES:=$(notdir $(OFILES))
OFILES:=$(addprefix $(TEST_OBJDIR)/,$(OFILES))
POLY_CFILES:=${shell find ${POLY_DIR} -name "*.cpp" -print}
POLY_OFILES:=$(patsubst %.cpp,%.o,$(POLY_CFILES))
POLY_OFILES:=$(notdir $(POLY_OFILES))
POLY_OFILES:=$(addprefix $(POLY_OBJDIR)/,$(POLY_OFILES))
OUTFILES:=$(BINDIR)/test
CPPFLAGS:=$(CPPFLAGS)
LDFLAGS:=$(LDFLAGS) -L$(BINDIR) -L/usr/local/lib -lboost_unit_test_framework -lsvg2
# Define sub-directories
VPATH:=$(dir $(CFILES)) $(INCDIR)

.PHONY: all clean mrproper test_pre test_post directories directories_pre directories_post

all: directories test_pre $(OUTFILES) test_post

test_pre:
	@$(ECHO) "-- Building tests --"

test_post: $(OUTFILES)
	@$(ECHO) "-- tests done --"	

$(TEST_OBJDIR)/%.o: %.cpp
	$(CROSS_COMPILE)$(CXX) $(CPPFLAGS) $(addprefix -I,$(INCDIR)) -c $< -o $@

$(BINDIR)/test: $(OFILES) $(POLY_OFILES)
	$(CROSS_COMPILE)$(CXX) $(POLY_OFILES) $(OFILES) $(LDFLAGS) -o $@

clean:
	@$(RM) $(TEST_OBJDIR)

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

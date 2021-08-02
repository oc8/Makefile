NAME		=
LST_SRCS	= \
	main.cpp
SRCS_DIR	= srcs
OBJS_DIR	= objs
SRCS		= $(addprefix $(SRCS_DIR)/,$(LST_SRCS))
OBJS		= $(LST_SRCS:%.cpp=$(OBJS_DIR)/%.o)
CXXC		= clang++
FLAGS		= -Wall -Werror -Wextra
CXXFLAGS	= $(FLAGS) -Iinc
RM			= rm -rf
MKDIR		= mkdir -p
INC			= inc/*.hpp

all:			$(NAME)

$(OBJS_DIR):
				$(MKDIR) $@

$(NAME):		$(OBJS_DIR) $(OBJS)
				$(CXXC) $(CXXFLAGS) $(OBJS) -o $(NAME)
				echo "$(BOLD)$(GREEN)$(ERASE)--> $(NAME) generated <--$(END)"

$(OBJS_DIR)/%.o:$(SRCS_DIR)/%.cpp	$(INC)
				$(MKDIR) $(dir $@)
				$(CXXC) $(CXXFLAGS) -o $@ -c $<
				printf "$(ERASE)--> [$(CYAN)$(BOLD)$<$(END)] <-- "

clean:
				$(RM) $(OBJS_DIR)

fclean:		clean
				$(RM) $(NAME)
				printf "$(ERASE)$(YELLOW)$(BOLD)--> $(NAME) CLEAN <--$(END)\n"

re:				fclean all

.PHONY: 		clean fclean all re
.SILENT:		clean fclean all re $(OBJS) $(NAME) $(OBJS_DIR)

ERASE	= \033[2K\r
GREY	= \033[30m
RED		= \033[31m
GREEN	= \033[32m
YELLOW	= \033[33m
BLUE	= \033[34m
PINK	= \033[35m
CYAN	= \033[36m
WHITE	= \033[37m
END		= \033[0m
BOLD	= \033[1m
UNDER	= \033[4m
SUR		= \033[7m

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

NAME		= name
LST_OBJS	= main.o
LST_SRCS	= ${SRCS:.o=.c}
INCLUDES	= ./inc/*.h
CC			= clang
RM			= rm -rf
FLAGS		= -Wall -Wextra -Werror
# FLAGS		= -Wall -Wextra -Werror -Ofast
# FLAGS		= -Wall -Wextra -Werror -g3 -fsanitize=address
# FLAGS		= -Wall -Wextra -Werror -g #(lldb)
AR			= ar
ARFLAGS		= rcs
PATH_SRCS	= srcs
PATH_OBJS	= objs
SRCS		= $(addprefix $(PATH_SRCS)/,$(LST_SRCS))
OBJS		= $(addprefix $(PATH_OBJS)/,$(LST_OBJS))

$(NAME):	$(OBJS)
			$(CC) $(FLAGS) -o $@ $(OBJS)
			printf "$(ERASE)$(GREEN)⤖ $(CYAN)$(NAME) : $(GREEN)ok$(END)\n"

$(PATH_OBJS)/%.o:		$(PATH_SRCS)/%.c $(INCLUDES)
			@mkdir -p $(PATH_OBJS)
			@$(CC) $(FLAGS) -c $< -o $@
			@printf "$(ERASE)$(CYAN)⤖ $(NAME) : $(RED)[$<]"

all:		$(NAME)

bonus:		$(NAME)

clean:		
			$(RM) $(PATH_OBJS)
			printf "$(ERASE)$(GREEN)⤖ $(CYAN)$(NAME) : $(GREEN)clean$(END)\n"

fclean:		clean
			$(RM) $(NAME)

re:			fclean all

.PHONY:		all clean fclean re
.SILENT:	fclean clean re $(NAME) all

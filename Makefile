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

NAME		= libasm
LOBJS		= main.o
LSRCS		= ${SRCS:.o=.c}
INCLUDES	= ./inc/libasm.h
CC			= clang
RM			= rm -rf
FLAGS		= -Wall -Wextra -Werror
# FLAGS		= -Wall -Wextra -Werror -Ofast
# FLAGS		= -Wall -Wextra -Werror -g3 -fsanitize=address
# FLAGS		= -Wall -Wextra -Werror -g #(lldb)
CFLAGS		= -I./inc -I./libft/ -I./minilibx -I./mlx
AR			= ar
ARFLAGS		= rcs
PATH_SRCS	= srcs
PATH_OBJS	= objs
SRCS		= $(addprefix $(PATH_SRCS)/,$(LSRCS))
OBJS		= $(addprefix $(PATH_OBJS)/,$(LOBJS))

$(NAME):	compilation $(OBJS)
			$(CC) $(FLAGS) -L./libft -lft -o $@ $(OBJS)
			printf "$(ERASE)$(GREEN)⤖ $(CYAN)$(NAME) : $(GREEN)ok$(END)\n"

no_flag:	compilation $(OBJS)

compilation	:
			make -C ./Libft/

$(PATH_OBJS)/%.o:		$(PATH_SRCS)/%.c $(INCLUDES) libft/libft.a
			@mkdir -p $(PATH_OBJS)
			@$(CC) $(FLAGS) $(CFLAGS) -c $< -o $@
			@printf "$(ERASE)$(CYAN)⤖ $(NAME) : $(RED)[$<]"

all:		$(NAME)

bonus:		$(NAME)

clean:		
			$(RM) $(PATH_OBJS)
			printf "$(ERASE)$(GREEN)⤖ $(CYAN)$(NAME) : $(GREEN)clean$(END)\n"
			make fclean -C ./Libft/

fclean:		clean
			$(RM) $(NAME)

re:			fclean all
			make -C ./Libft/

.PHONY:		all clean fclean re no_flag
.SILENT:	fclean clean re $(NAME) no_flag compilation all
NAME			= 
LST_SRCS		= \
	main.c
SRCS_DIR		= srcs
OBJS_DIR		= objs
SRCS			= $(addprefix $(SRCS_DIR)/,$(LST_SRCS))
OBJS			= $(LST_SRCS:%.c=$(OBJS_DIR)/%.o)
CC				= clang
CFLAGS			= -Wall -Werror -Wextra
# CFLAGS			= -g
# CFLAGS			= -Wall -Werror -Wextra -fsanitize=address -g3
# CFLAGS			= -fsanitize=address -g3
INCLUDE			= -Iinc -I${LIBFT}/inc
RM				= rm -rf
MKDIR			= mkdir -p
LIBFT			= libft

all:			libft $(NAME)

$(OBJS_DIR):
				$(MKDIR) $@

libft:
				printf "$(ERASE)${GREEN}--> LIBFT <--${END}"
				make -C ${LIBFT} > SILENT
				$(RM) SILENT
				printf "$(ERASE)"

${NAME}:		libft ${OBJS_DIR} ${OBJS}
				${CC} ${CFLAGS} ${INCLUDE} ${OBJS} -L ${LIBFT} -lft -o ${NAME}
				echo "$(BOLD)${GREEN}$(ERASE)--> ${NAME} generated <--${END}"

$(OBJS_DIR)/%.o:$(SRCS_DIR)/%.c inc/*.h
				$(MKDIR) $(dir $@)
				${CC} ${CFLAGS} $(INCLUDE) -c  $< -o $@
				printf "$(ERASE)--> [$(GREEN)$<$(END)] <--"

clean:
				${RM} $(OBJS)
				make clean -C $(LIBFT) > SILENT
				$(RM) SILENT

fclean:			clean
				${RM} $(OBJS_DIR) $(NAME)
				printf "$(ERASE)${GREEN}--> LIBFT CLEAN<--${END}"
				make fclean -C $(LIBFT) > SILENT
				$(RM) SILENT
				printf "$(ERASE)${GREEN}--> ${NAME} CLEAN <--${END}\n"

re:				fclean all

.PHONY: 		clean fclean all re libft
.SILENT:		clean fclean all re libft $(OBJS) $(NAME) $(OBJS_DIR)

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

NAME			= 
NAME1			= 
NAME2			= 
LST1			= \
	main.c
LST2			= \
	main.c
LST_SRCS		= \
	utils/write.c
LST_SRCS1		= $(addprefix $(NAME1)/,$(LST1))
LST_SRCS2		= $(addprefix $(NAME2)/,$(LST2))
SRCS_DIR		= srcs
OBJS_DIR		= objs
OBJS			= $(LST_SRCS:%.c=$(OBJS_DIR)/%.o)
OBJS1			= $(LST_SRCS1:%.c=$(OBJS_DIR)/%.o)
OBJS2			= $(LST_SRCS2:%.c=$(OBJS_DIR)/%.o)
CC				= clang
# FLAGS			= -Wall -Werror -Wextra
FLAGS			= -g
# FLAGS			= -Wall -Werror -Wextra -fsanitize=address -g3
# FLAGS			= -fsanitize=address -g3
CFLAGS			= -Iinc
INCLUDE			= ./inc/*.h
RM				= rm -rf
MKDIR			= mkdir -p

all:			$(NAME)

$(OBJS_DIR):
				$(MKDIR) $@

$(NAME1):		${OBJS_DIR} ${OBJS1} $(OBJS)
				${CC} ${FLAGS} ${CFLAGS} ${OBJS1} $(OBJS) -o ${NAME1}
				echo "$(BOLD)${GREEN}$(ERASE)--> ${NAME1} generated <--${END}"

$(NAME2):		${OBJS_DIR} ${OBJS2} $(OBJS)
				${CC} ${FLAGS} ${CFLAGS} ${OBJS2} $(OBJS) -o ${NAME2}
				echo "$(BOLD)${GREEN}$(ERASE)--> ${NAME2} generated <--${END}"

${NAME}:		${OBJS_DIR} ${OBJS1} ${OBJS2} $(OBJS)
				${CC} ${FLAGS} ${CFLAGS} ${OBJS1} $(OBJS) -o ${NAME1}
				${CC} ${FLAGS} ${CFLAGS} ${OBJS2} $(OBJS) -o ${NAME2}
				echo "$(BOLD)${GREEN}$(ERASE)--> ${NAME1} generated <--${END}"
				echo "$(BOLD)${GREEN}$(ERASE)--> ${NAME2} generated <--${END}"
				echo "$(BOLD)${GREEN}$(ERASE)--> ${NAME} ready <--${END}"

$(OBJS_DIR)/%.o:$(SRCS_DIR)/%.c $(INCLUDE)
				$(MKDIR) $(dir $@)
				${CC} ${FLAGS} $(CFLAGS) -c  $< -o $@
				printf "$(ERASE)--> [$(GREEN)$<$(END)] <--"

clean:
				${RM} $(OBJS1) $(OBJS2) $(OBJS)

fclean:			clean
				${RM} $(OBJS_DIR) $(NAME1) $(NAME2)
				echo "$(ERASE)${GREEN}--> ${NAME} CLEAN <--${END}"

re:				fclean all

.PHONY: 		clean fclean all re compil libft
.SILENT:		clean fclean all re compil libft $(OBJS) $(OBJS1) $(OBJS2) $(NAME) $(NAME1) $(NAME2) $(OBJS_DIR)

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

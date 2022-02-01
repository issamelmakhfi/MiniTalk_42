CFILES	= server.c client.c minitalk_utils.c
OFILES	= ${CFILES:.c=.o}
BCFILES = server_bonus.c client_bonus.c minitalk_utils_bonus.c
BOFILES = ${BCFILES:.c=.o}
client	= client
server	= server
client_bonus	= client_bonus
server_bonus	= server_bonus
CC		= @gcc
CFLAGS	= -Wall -Wextra -Werror
NAME	= minitalk.a
NAME_BONUS = minitalk_bonus.a
RM		= rm -rf

all				: ${server} ${client}

bonus			: ${server_bonus} ${client_bonus}

${server}		: ${NAME}
	@${CC} ${CFLAGS} ${NAME} server.c -o ${server}

${client}		: ${NAME}
	@${CC} ${CFLAGS} ${NAME} client.c -o ${client}

${server_bonus}	: ${NAME_BONUS}
	@${CC} ${CFLAGS} ${NAME_BONUS} server_bonus.c -o ${server_bonus}

${client_bonus}	: ${NAME_BONUS}
	@${CC} ${CFLAGS} ${NAME_BONUS} client_bonus.c -o ${client_bonus}

${NAME}			: ${OFILES}
	@ar -cr ${NAME} ${OFILES}
	@echo "\033[92mDone for Minitalk\033[0m"

${NAME_BONUS}	: ${BOFILES}
	@ar -cr ${NAME_BONUS} ${BOFILES}
	@echo "\033[92mDone for Minitalk_bonus\033[0m"

clean :
	@${RM} ${OFILES} ${BOFILES}
	@echo "\033[92mClean Success\033[0m"

fclean			: clean
	@${RM} ${NAME} ${NAME_BONUS}
	@${RM} ${server} ${client}
	@${RM} ${server_bonus} ${client_bonus}
	@echo "\033[92mFclean Success\033[0m"

re 				: fclean all
NAME = ft_ls

CC = cc
CCFLAGS = -Wall -Wextra -Werror

INCLUDES_DIR = include/
INCLUDES = -I $(INCLUDES_DIR)

HEADER_FILES = ls.h
HEADERS = $(addprefix $(INCLUDES_DIR), $(HEADER_FILES))

SRCS_DIR = src/
SRCS_FILES = main.c
SRCS = $(addprefix $(SRCS_DIR), $(SRCS_FILES))

OBJS = $(SRCS:.c=.o)

all: $(NAME)

$(NAME): $(OBJS)
	$(CC) $(CFLAGS) $(OBJS) -o $(NAME)

%.o: %.cpp $(HEADERS)
	$(CC) $(CFLAGS) $(INCLUDES) -c $< -o $@

clean:
	$(RM) $(OBJS)

fclean: clean
	$(RM) $(NAME)

format:
	clang-format -i $(SRCS) $(HEADERS)

linter:
	clang-tidy $(SRCS) --extra-arg="-I$(INCLUDES_DIR)"

re: fclean all

.PHONEY: all clean fclean format linter re

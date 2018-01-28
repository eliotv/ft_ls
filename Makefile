NAME = ft_ls

CC = gcc
CFLAGS = -Wall -Wextra -Werror
CFLAGS += -I includes -I libft/includes
LDFLAGS += -L libft/ -lft

LIBFT := libft/libft.a

FT_LS = \


SRC = $(addprefix src/, $(FT_LS))

OBJ = $(SRC.c=.o)

all : $(NAME)

$(LIBFT):
	@make -C libft

$(OBJ): %.o: %.C
	@$(CC) -c $(LDFLAGS) $< -o $@

$(NAME): $(LIBFT) $(OBJ)
	@$(CC) $(LDFLAGS) -o $@ $^
	@echo "/033[32m Object Files Created \ 033[0m
	@echo "/033[32m $(NAME) Executable Createded \033[0m

clean:
	@rm -rf $(OBJ)
	make -C libft clean
	@echo "\033[31m $(NAME) Object Files Removed \033[0m"

fclean: clean
	@rm -rf $(NAME)
	@make -C libft fclean
	@echo "\033[31 $(NAME) Executable Removed \033[0m"

re: fclean all
/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   test_write.c                                       :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: vscabell <vscabell@student.42sp.org.br>    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2020/09/20 20:20:50 by vscabell          #+#    #+#             */
/*   Updated: 2020/09/26 19:21:49 by vscabell         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "header_test.h"

static void	result(ssize_t (*ft)(), int fd, char *str)
{
	ssize_t	ret;

	ret = ft(fd, str, strlen(str));
	printf("return = %zd\n", ret);
	printf("errno = %d\n", errno);
}

static void	test(int fd, char funct, char *str)
{
	if (funct == ORIG)
		result(write, fd, str);
	else if (funct == IMPLEM)
		result(ft_write, fd, str);
}

int			main(int argc, char **argv)
{
	int		fd;
	int		type;
	int		funct;
	char	*str;

	fd = 0;
	type = atoi(argv[1]);
	funct = atoi(argv[2]);
	str = "Hello World!";
	if (argc > 2)
		fd = open(argv[3], O_CREAT | O_RDWR | O_TRUNC, S_IRUSR | S_IWUSR);
	if (type == STD)
		test(STDOUT_FILENO, funct, str);
	else if (type == FD_OPEN)
		test(fd, funct, str);
	else if (type == FD_WRONG)
		test(fd + 5, funct, str);
	close (fd);
	return (0);
}



/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   test_write_fd.c                                    :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: vscabell <vscabell@student.42sp.org.br>    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2020/09/20 20:20:50 by vscabell          #+#    #+#             */
/*   Updated: 2020/09/24 02:20:58 by vscabell         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "header_test.h"

void	result(ssize_t (*ft)(), int fd, char *str)
{
	ssize_t	ret;

	ret = ft(fd, str, strlen(str));
	printf("%zd\n", ret);
	printf("%d\n", errno);
}

int		main(int argc, char **argv)
{
	int		fd;
	char	*str;

	str = "Hello World!";
	fd = open(argv[3], O_CREAT | O_RDWR | O_TRUNC, S_IRUSR | S_IWUSR);
	if (argv[1][0] == FD_OPEN)
	{
		if (argv[2][0] == ORIG)
			result(write, fd, str);
		else if (argv[2][0] == IMPLEM)
			result(ft_write, fd, str);
	}
	else if (argv[1][0] == FD_WRONG)
	{
		if (argv[2][0] == ORIG)
			result(write, fd + 5, str);
		else if (argv[2][0] == IMPLEM)
			result(ft_write, fd + 5, str);
	}
	close (fd);
	return (0);
}

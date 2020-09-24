/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   test_read_fd.c                                     :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: vscabell <vscabell@student.42sp.org.br>    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2020/09/20 20:20:50 by vscabell          #+#    #+#             */
/*   Updated: 2020/09/24 02:21:11 by vscabell         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "header_test.h"

void	result(ssize_t (*ft)(), int fd)
{
	ssize_t	ret;
	char	buffer[101];

	ret = ft(fd, buffer, 100);
	buffer[ret] = '\0';
	printf("%s\n", buffer);
	printf("%zd\n", ret);
	printf("%d\n", errno);
}

int	main(int argc, char **argv)
{
	int	fd;

	fd = open(argv[3], O_RDWR);
	if (argv[1][0] == FD_OPEN)
	{
		if (argv[2][0] == ORIG)
			result(read, fd);
		else if (argv[2][0] == IMPLEM)
			result(ft_read, fd);
	}
	else if (argv[1][0] == FD_WRONG)
	{
		if (argv[2][0] == ORIG)
			result(read, fd + 5);
		else if (argv[2][0] == IMPLEM)
			result(ft_read, fd + 5);
	}
	close (fd);
	return (0);
}

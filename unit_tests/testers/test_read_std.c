/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   test_read_stdout.c                                :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: vscabell <vscabell@student.42sp.org.br>    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2020/09/20 20:20:50 by vscabell          #+#    #+#             */
/*   Updated: 2020/09/20 21:52:25 by vscabell         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "header_test.h"

void	result(ssize_t (*ft)())
{
	ssize_t	ret;
	char	buffer[101];

	ret = ft(STDIN_FILENO, buffer, 100);
	buffer[ret] = '\0';
	printf("%s\n", buffer);
	printf("%zd\n", ret);
	printf("%d\n", errno);
}

int	main(int argc, char **argv)
{
	if (argv[1][0] == ORIG)
		result(&read);
	else if (argv[1][0] == IMPLEM)
		result(&ft_read);
	return (0);
}

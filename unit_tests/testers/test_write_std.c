/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   test_write_std.c                                   :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: vscabell <vscabell@student.42sp.org.br>    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2020/09/20 20:20:50 by vscabell          #+#    #+#             */
/*   Updated: 2020/09/24 18:50:14 by vscabell         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "header_test.h"

void	result(ssize_t (*ft)(), char *str)
{
	ssize_t	ret;

	ret = ft(STDOUT_FILENO, str, strlen(str));
	printf("%zd\n", ret);
	printf("%d\n", errno);
}

int		main(int argc, char **argv)
{
	char	*str;

	(void)argc;
	str = "Hello World!";
	if (argv[1][0] == ORIG)
		result(write, str);
	else if (argv[1][0] == IMPLEM)
		result(ft_write, str);
	return (0);
}

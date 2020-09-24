/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   test_strcpy.c                                      :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: vscabell <vscabell@student.42sp.org.br>    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2020/09/20 19:49:31 by vscabell          #+#    #+#             */
/*   Updated: 2020/09/24 02:21:33 by vscabell         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "header_test.h"

void	result(char *(*ft)(), char *src)
{
	char	dst[100];

	bzero(dst, 1);
	printf("%s\n", dst);
	printf("%s\n", ft(dst, src));
}

int		main(int argc, char **argv)
{
	if (argv[1][0] == ORIG)
		result(strcpy, argv[2]);
	else if (argv[1][0] == IMPLEM)
		result(ft_strcpy, argv[2]);
	return (0);
}

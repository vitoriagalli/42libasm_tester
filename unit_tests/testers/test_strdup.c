/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   test_strdup.c                                      :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: vscabell <vscabell@student.42sp.org.br>    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2020/09/20 19:49:31 by vscabell          #+#    #+#             */
/*   Updated: 2020/09/24 02:20:34 by vscabell         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "header_test.h"

void	result(char *(*ft)(), char *src)
{
	char *dst;

	dst = ft(src);
	printf("%s\n", dst);
	free(dst);
}

int		main(int argc, char **argv)
{
	if (argv[1][0] == ORIG)
		result(strdup, argv[2]);
	else if (argv[1][0] == IMPLEM)
		result(ft_strdup, argv[2]);
	return (0);
}

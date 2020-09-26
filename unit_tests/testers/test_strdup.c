/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   test_strdup.c                                      :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: vscabell <vscabell@student.42sp.org.br>    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2020/09/20 19:49:31 by vscabell          #+#    #+#             */
/*   Updated: 2020/09/26 19:17:26 by vscabell         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "header_test.h"

static void	result(char *(*ft)(), char *src)
{
	char *dst;

	dst = ft(src);
	printf("return = %s\n", dst);
	free(dst);
}

int			main(int argc, char **argv)
{
	int		funct;
	char	*input;

	funct = atoi(argv[1]);
	input = argv[2];
	(void)argc;
	if (funct == ORIG)
		result(strdup, input);
	else if (funct == IMPLEM)
		result(ft_strdup, input);
	return (0);
}

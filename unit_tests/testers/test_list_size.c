/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   test_list_size.c                                   :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: vscabell <vscabell@student.42sp.org.br>    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2020/09/23 17:20:00 by vscabell          #+#    #+#             */
/*   Updated: 2020/09/23 19:41:12 by vscabell         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "header_test.h"

int	main(int argc, char **argv)
{
	int		index;
	t_list	*list;

	index = atoi(argv[1]);
	initialize_list(&list, index, &list_push_front);
	printf("%i\n", ft_list_size(list));
	ft_list_clear(list, &ft_free);
	return (0);
}

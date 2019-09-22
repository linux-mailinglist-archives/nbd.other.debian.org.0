Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id A82E1BA043
	for <lists+nbd@lfdr.de>; Sun, 22 Sep 2019 04:38:47 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 647BE20571; Sun, 22 Sep 2019 02:38:47 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Sun Sep 22 02:38:47 2019
Old-Return-Path: <xiubli@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.5 required=4.0 tests=DIGITS_LETTERS,LDOSUBSCRIBER,
	LDO_WHITELIST,MONEY,MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_HI
	autolearn=unavailable autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 7572120481
	for <lists-other-nbd@bendel.debian.org>; Sun, 22 Sep 2019 02:38:40 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-10.48 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, LDO_WHITELIST=-5, MONEY=0.5,
	MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_HI=-5]
	autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id FHQi9WVKRNRi for <lists-other-nbd@bendel.debian.org>;
	Sun, 22 Sep 2019 02:38:36 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 520BB20483
	for <nbd@other.debian.org>; Sun, 22 Sep 2019 02:38:36 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id DB2243086218;
	Sun, 22 Sep 2019 02:38:32 +0000 (UTC)
Received: from [10.72.12.58] (ovpn-12-58.pek2.redhat.com [10.72.12.58])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7E5B85D9E2;
	Sun, 22 Sep 2019 02:38:28 +0000 (UTC)
Subject: Re: [PATCH RESEND] nbd: avoid losing pointer to reallocated
 config->socks in nbd_add_socket
To: Eugene Syromiatnikov <esyr@redhat.com>, linux-block@vger.kernel.org,
 Josef Bacik <josef@toxicpanda.com>, nbd@other.debian.org
Cc: linux-kernel@vger.kernel.org, Jens Axboe <axboe@kernel.dk>
References: <20190920160644.GA15739@asgard.redhat.com>
From: Xiubo Li <xiubli@redhat.com>
Message-ID: <b8c7fdec-700d-e4a6-9fd6-a63c09e7a613@redhat.com>
Date: Sun, 22 Sep 2019 10:38:24 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20190920160644.GA15739@asgard.redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.42]); Sun, 22 Sep 2019 02:38:32 +0000 (UTC)
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <j837Ye-9rHF.A.wdD.36thdB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/692
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/b8c7fdec-700d-e4a6-9fd6-a63c09e7a613@redhat.com
Resent-Date: Sun, 22 Sep 2019 02:38:47 +0000 (UTC)

On 2019/9/21 0:06, Eugene Syromiatnikov wrote:
> In the (very unlikely) case of config->socks reallocation success
> and nsock allocation failure config->nsock will not get updated
> with the new pointer to socks array. Fix it by updating config->socks
> right after reallocation successfulness check.
>
> Fixes: 9561a7ade0c2 ("nbd: add multi-connection support")
> Signed-off-by: Eugene Syromiatnikov <esyr@redhat.com>
> Cc: stable@vger.kernel.org # 4.10+
> ---
>   drivers/block/nbd.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
> index a8e3815..a04c686 100644
> --- a/drivers/block/nbd.c
> +++ b/drivers/block/nbd.c
> @@ -987,14 +987,14 @@ static int nbd_add_socket(struct nbd_device *nbd, unsigned long arg,
>   		sockfd_put(sock);
>   		return -ENOMEM;
>   	}
> +	config->socks = socks;
> +
>   	nsock = kzalloc(sizeof(struct nbd_sock), GFP_KERNEL);
>   	if (!nsock) {
>   		sockfd_put(sock);
>   		return -ENOMEM;
>   	}
>   
> -	config->socks = socks;
> -

This makes sense.

If the socks allocating successes, then the old config->socks will be 
freed by krealloc() and return the new one, but if the nsock allocating 
fails, the config->socks will hold the released memory, which may cause 
the kernel crash.

Thanks

BRs



>   	nsock->fallback_index = -1;
>   	nsock->dead = false;
>   	mutex_init(&nsock->tx_lock);



Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EBA252C252
	for <lists+nbd@lfdr.de>; Wed, 18 May 2022 20:36:18 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 362D62039E; Wed, 18 May 2022 18:36:18 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed May 18 18:36:10 2022
Old-Return-Path: <joe@perches.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=0.6 required=4.0 tests=KHOP_HELO_FCRDNS,
	MURPHY_DRUGS_REL8,SARE_MSGID_LONG40,T_SCC_BODY_TEXT_LINE,
	UNPARSEABLE_RELAY autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id CE4E9203E0
	for <lists-other-nbd@bendel.debian.org>; Wed, 18 May 2022 18:19:51 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-1.351 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, KHOP_HELO_FCRDNS=0.001, MURPHY_DRUGS_REL8=0.02,
	SARE_MSGID_LONG40=0.637, T_SCC_BODY_TEXT_LINE=-0.01,
	UNPARSEABLE_RELAY=0.001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id vj-TrZP3sldC for <lists-other-nbd@bendel.debian.org>;
	Wed, 18 May 2022 18:19:48 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 HELO_IP_IN_CL16_SUBNET=-0.41 (check from: .perches. - helo: .relay5.hostedemail. - helo-domain: .hostedemail.)  FROM/MX_MATCHES_UNVR_HELO(DOMAIN)_OR_CL_NAME(DOMAIN)=-1.5 REV_IP_EQ_HELO_DOMAIN=-1.25; rate: -4.66
X-Greylist: delayed 449 seconds by postgrey-1.36 at bendel; Wed, 18 May 2022 18:19:48 UTC
Received: from relay5.hostedemail.com (smtprelay0015.hostedemail.com [216.40.44.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id D5D0B203AC
	for <nbd@other.debian.org>; Wed, 18 May 2022 18:19:47 +0000 (UTC)
Received: from omf01.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay07.hostedemail.com (Postfix) with ESMTP id C66A02086D;
	Wed, 18 May 2022 18:12:13 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf01.hostedemail.com (Postfix) with ESMTPA id 42ABB6000E;
	Wed, 18 May 2022 18:12:12 +0000 (UTC)
Message-ID: <f0acebb66b9b46ad472e0d0989dc0f5810cac3dd.camel@perches.com>
Subject: Re: [PATCH -next v2 6/6] nbd: use pr_err to output error message
From: Joe Perches <joe@perches.com>
To: Yu Kuai <yukuai3@huawei.com>, josef@toxicpanda.com, axboe@kernel.dk, 
	ming.lei@redhat.com
Cc: linux-block@vger.kernel.org, nbd@other.debian.org, 
	linux-kernel@vger.kernel.org, yi.zhang@huawei.com
Date: Wed, 18 May 2022 11:12:11 -0700
In-Reply-To: <20220518122618.1702997-7-yukuai3@huawei.com>
References: <20220518122618.1702997-1-yukuai3@huawei.com>
	 <20220518122618.1702997-7-yukuai3@huawei.com>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.40.4-1ubuntu2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Stat-Signature: w4co9fngahnb146d6hsxcz85b1hfpa7z
X-Rspamd-Server: rspamout04
X-Rspamd-Queue-Id: 42ABB6000E
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX19oEFmBk8xUFTV8bdFQZy9WR91s/9xDnsE=
X-HE-Tag: 1652897532-761824
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <ZwwN9eSBJuD.A.HAD.ayThiB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2083
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/f0acebb66b9b46ad472e0d0989dc0f5810cac3dd.camel@perches.com
Resent-Date: Wed, 18 May 2022 18:36:18 +0000 (UTC)

On Wed, 2022-05-18 at 20:26 +0800, Yu Kuai wrote:
> Instead of using the long printk(KERN_ERR "nbd: ...") to
> output error message, defining pr_fmt and using
> the short pr_err("") to do that. The replacemen is done
> by using the following command:
> 
>   sed -i 's/printk(KERN_ERR "nbd: /pr_err("/g' \
> 		  drivers/block/nbd.c

It's also good to rewrap to 80 columns where possible.

> diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
[]
> @@ -2130,13 +2130,13 @@ static int nbd_genl_disconnect(struct sk_buff *skb, struct genl_info *info)
>  	nbd = idr_find(&nbd_index_idr, index);
>  	if (!nbd) {
>  		mutex_unlock(&nbd_index_mutex);
> -		printk(KERN_ERR "nbd: couldn't find device at index %d\n",
> +		pr_err("couldn't find device at index %d\n",
>  		       index);

like here

>  		return -EINVAL;
>  	}
>  	if (!refcount_inc_not_zero(&nbd->refs)) {
>  		mutex_unlock(&nbd_index_mutex);
> -		printk(KERN_ERR "nbd: device at index %d is going down\n",
> +		pr_err("device at index %d is going down\n",
>  		       index);

and here and below...

> @@ -2170,7 +2170,7 @@ static int nbd_genl_reconfigure(struct sk_buff *skb, struct genl_info *info)
>  	nbd = idr_find(&nbd_index_idr, index);
>  	if (!nbd) {
>  		mutex_unlock(&nbd_index_mutex);
> -		printk(KERN_ERR "nbd: couldn't find a device at index %d\n",
> +		pr_err("couldn't find a device at index %d\n",
>  		       index);
>  		return -EINVAL;
>  	}
> @@ -2192,7 +2192,7 @@ static int nbd_genl_reconfigure(struct sk_buff *skb, struct genl_info *info)
>  	}
>  	if (!refcount_inc_not_zero(&nbd->refs)) {
>  		mutex_unlock(&nbd_index_mutex);
> -		printk(KERN_ERR "nbd: device at index %d is going down\n",
> +		pr_err("device at index %d is going down\n",
>  		       index);
>  		return -EINVAL;
>  	}



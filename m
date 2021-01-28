Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B4BA307EC3
	for <lists+nbd@lfdr.de>; Thu, 28 Jan 2021 20:43:23 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 7007F203BE; Thu, 28 Jan 2021 19:43:23 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu Jan 28 19:43:23 2021
Old-Return-Path: <Markus.Elfring@web.de>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FOURLA,FREEMAIL_FROM,LDOSUBSCRIBER,
	MURPHY_DRUGS_REL8,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,
	RCVD_IN_MSPIKE_WL autolearn=unavailable autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id DD3CA20361
	for <lists-other-nbd@bendel.debian.org>; Thu, 28 Jan 2021 19:43:15 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-5.526 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1,
	FREEMAIL_FROM=0.001, MURPHY_DRUGS_REL8=0.02, NICE_REPLY_A=-2.749,
	RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
	RCVD_IN_MSPIKE_WL=0.001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id NPa20yczLPsw for <lists-other-nbd@bendel.debian.org>;
	Thu, 28 Jan 2021 19:43:11 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from mout.web.de (mout.web.de [212.227.15.14])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 7DAB2201E5
	for <nbd@other.debian.org>; Thu, 28 Jan 2021 19:43:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
	s=dbaedf251592; t=1611862982;
	bh=BLlEXcZ6prRtbfJMzLzxztYtxqiy27W1CH++m67oYd0=;
	h=X-UI-Sender-Class:To:Cc:References:From:Subject:Date:In-Reply-To;
	b=CBh5MajTFSKS5z7rVq6aq+6jGVPzT4MmFH+etMLE9Qygsr1s6kTq1zKFiLUrJfCM/
	 fTdgxBw3CWyMdkA7UACasGuMT4uEIdlcQz/mCZjuDpWyaPdEPTCEcF2XBKz+mirSSW
	 NuYGCjIjxS8dheSQzMGVUKod3wHIuNt8zpivv/mE=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([93.135.108.249]) by smtp.web.de (mrweb004
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0Lgb2b-1ljn9M3esP-00nux3; Thu, 28
 Jan 2021 20:43:01 +0100
To: Sun Ke <sunke32@huawei.com>, linux-block@vger.kernel.org,
 nbd@other.debian.org
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
 Jens Axboe <axboe@kernel.dk>, Josef Bacik <josef@toxicpanda.com>
References: <20210128074153.1633374-1-sunke32@huawei.com>
From: Markus Elfring <Markus.Elfring@web.de>
Subject: Re: [PATCH] nbd: Fix NULL pointer in flush_workqueue
Message-ID: <1739e522-5980-f86e-cb90-19b61539a5cf@web.de>
Date: Thu, 28 Jan 2021 20:42:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210128074153.1633374-1-sunke32@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:1WJLBP48O9a/Itd3Td91o+hbJEb7HuRGVjthOWm7uXiej5u4Zi5
 bLGaXUd9Is1EkoZyn7BTeGXHdeHsPMREKpEtVvO6ZAmv0pmqOCPwiQrcfXrm2nlipqvzuQd
 b/QsP5RpsRU/FgEBtHEC3TLxDaGgv7211q01+H/3o5W5/0TzEOKAaxMCF+Z1kW76soau23G
 yH3euPlk6n7UckpKVVY2A==
X-UI-Out-Filterresults: notjunk:1;V03:K0:bux+jcRMn/k=:35EI0ydbpxZ2zKFQo4Dd/y
 Hu7nZdeppE0T8coe4le4CBBF2ALNGSB9L5T8vZwYZ95NDR2d5OpkQ9qGtVXnn+j82QCoqt2Xc
 uw5lcL65K+rerpVsgtWPHZBT6BoyxdhyCqkyM+LtHzm4pnDmdRXz7A8c5VQkctOFsuQNdOkou
 k4HB8gIbgLlf2GWZHgiPBjVHXJ92gU7rCFYV8Ik7HcfNZVMF73buwC8HnmocrRUj6eX70EFyL
 R5C5/2PnhULTHr2mcZokIY7gjYiF/kqpCy94k0PR8lhBq4yeY8dZZ8jChiM4DZignXvotXhcq
 WsHi2KRdZfQNOUnArlaW4H5nJViEhs0mIZWJNpZFPgdEft9LJdgpaKEv/3UNNDKGyN1dti6yi
 NvRp6xZCYs5nlhRQQeTnT7jMqL4SAZ0sUitrgnqRIZ+yNH+4gOnMY4pxOoTtwnMqSe9FHeJK8
 qwWKv4uxgA5hvD6J5oloriKA35ulLT96Sp2ODksaG3NaZ+/9vPT7CFPSbn9WMSohS1r36NBwn
 G/o39thPBb1uXAQNSSKniBUtvFQ/tvR2LsVA8li+Ux1s4eXf9dpcrZZwWUhsQ+pZnyfBAbwRY
 ol4VbTioqu/loekpx99T1S9Cv4ctUelAtylby7/Klex4ZNvLb6Kj8VlsaqWCZ00CLbGaCCulU
 Y7mc0f9nBvTp7MI8i5cnw7zkwaOB4A3//MiV7uHQKwpTAlgtnghMVsbspcvmi+ErOKDrncVB1
 Op0Sb/ws+AbBsEzDyvEMq1RPBT1qUxvLdQsUY0ZGDNxVYmEYiOfW0St2wX7WJ2OqJP6A1m+e2
 jOW91iXPsDMvkrtO1RlR89iV3of7EMKm9N4McQsJpl24yzGR9uCbj6aEVLrP8zZBMpS20+6ww
 tw42hmyi8crRr7HghxFw==
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <RfxT_OijYxN.A.QP.bPxEgB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1108
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/1739e522-5980-f86e-cb90-19b61539a5cf@web.de
Resent-Date: Thu, 28 Jan 2021 19:43:23 +0000 (UTC)

=E2=80=A6
> +++ b/drivers/block/nbd.c
> @@ -2011,12 +2011,20 @@ static int nbd_genl_disconnect(struct sk_buff *s=
kb, struct genl_info *info)
>  		       index);
>  		return -EINVAL;
>  	}
> +	mutex_lock(&nbd->config_lock);
>  	if (!refcount_inc_not_zero(&nbd->refs)) {
>  		mutex_unlock(&nbd_index_mutex);
> +		mutex_unlock(&nbd->config_lock);

Can an other function call order become relevant for the unlocking of thes=
e mutexes?


>  		printk(KERN_ERR "nbd: device at index %d is going down\n",
>  		       index);

May such an error message be moved into the lock scope?


>  		return -EINVAL;
>  	}
> +	if (!nbd->recv_workq) {
> +		mutex_unlock(&nbd->config_lock);
> +		mutex_unlock(&nbd_index_mutex);
> +		return -EINVAL;
> +	}

How do you think about to connect the code from this if branch
with a jump target like =E2=80=9Cunlock=E2=80=9D so that such statements w=
ould be shareable
for the desired exception handling?


> +	mutex_unlock(&nbd->config_lock);
>  	mutex_unlock(&nbd_index_mutex);
>  	if (!refcount_inc_not_zero(&nbd->config_refs)) {
>  		nbd_put(nbd);


Regards,
Markus


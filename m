Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 04F1030B009
	for <lists+nbd@lfdr.de>; Mon,  1 Feb 2021 20:05:45 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id B1FCA2060F; Mon,  1 Feb 2021 19:05:44 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon Feb  1 19:05:44 2021
Old-Return-Path: <Markus.Elfring@web.de>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FOURLA,FREEMAIL_FROM,LDOSUBSCRIBER,
	MURPHY_DRUGS_REL8,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL autolearn=unavailable autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 8A74B20540
	for <lists-other-nbd@bendel.debian.org>; Mon,  1 Feb 2021 19:05:36 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-5.526 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1,
	FREEMAIL_FROM=0.001, MURPHY_DRUGS_REL8=0.02, NICE_REPLY_A=-2.749,
	RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
	RCVD_IN_MSPIKE_WL=0.001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id TYTPTXjo1uPb for <lists-other-nbd@bendel.debian.org>;
	Mon,  1 Feb 2021 19:05:32 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from mout.web.de (mout.web.de [212.227.17.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id E9CA3204B8
	for <nbd@other.debian.org>; Mon,  1 Feb 2021 19:05:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
	s=dbaedf251592; t=1612206315;
	bh=4LP6/tEkqswD+N7P9ESxLiHziB2PS2tacDcB7pnCgDc=;
	h=X-UI-Sender-Class:To:Cc:References:From:Subject:Date:In-Reply-To;
	b=Iz5vtP5vYubj3w7NYoLDYjrCMNvJa4kNBINkPEHXueaUdImzx+TnF31kqom6INlFJ
	 4uL+09zH0/L8rYN2qXNIwgxWVQyOzHaEu5Cu9qaAXUJlATYLdR5mufpNZ+XZ2haVX/
	 3S2VudZCtdqeyDx4nONebPJJzXGoC3IEhGw/lWiM=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([93.133.98.46]) by smtp.web.de (mrweb101
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0Mcni1-1lOSTa0P3Z-00Hygp; Mon, 01
 Feb 2021 20:05:15 +0100
To: Sun Ke <sunke32@huawei.com>, Josef Bacik <josef@toxicpanda.com>,
 Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org,
 nbd@other.debian.org
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
References: <20210201081918.558905-1-sunke32@huawei.com>
From: Markus Elfring <Markus.Elfring@web.de>
Subject: Re: [PATCH v2] nbd: Fix NULL pointer in flush_workqueue
Message-ID: <ebe7beb2-336d-35d4-48af-8f8cad7b868b@web.de>
Date: Mon, 1 Feb 2021 20:05:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210201081918.558905-1-sunke32@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:pjFQqgVeQvGS+GZsBqVKL8SOtu5En0eQ8Ne7pBPo7KUmAiQ8KU7
 Cq82kBWL0HWrBQzPxuXHNF/xtSyzN7IoXnne3KdkesUycXXs40f5W4Na5MbMbgt3EBOSgNX
 Z4Kpui1MNqB7H1MtJlA3vq28OFUSfkd0vr6+xtrD5XWR/9UXmg+A6C7D7FQS1jgEv85jfm6
 xuPmqBYekPkvdixhOb72Q==
X-UI-Out-Filterresults: notjunk:1;V03:K0:aG+ERI+HhSw=:Q6Nx4YneB+EIEy10VrAS3h
 bHIKKZ9uSKcOMUN6Ex2g+Y009L0jXSV978vgILYjnuVmArDm7+uJVEkgLG+l26FhLwUK9NhvL
 1tzrVmgeZpcNTr87yBpLNTM732V47g9ZTcVukdisAhAFOBJV5KJGg/sCauPusAzARH4KiST0K
 c+JAyYzp4hIWcDyFu/EmSTOouA2r00yO/untTu1qfTIitLXiTaoR7+bE5xBsUo8PBD2gyYtEp
 SjNn3TZwHMO+d3tbA/YgJL7gu4D3lqDdiCJe3Z2w03viQ6Erv5WLZr1W+WBgHxUK0cW4iqq2N
 tN1XCOsNi+Z1AfGQ2hsVWqTLbuFRsA8317o+C0ZJlpUYlB1R3gCWvosFus9Hl7zeIWKEGuKxL
 6FqyxfNSv9q1YRgabXBsgdK2sNrFsL2VM+9MctvKF7UeFwUi+cLpDUhdk93/3R5jlJ1VV9ca2
 o1OYHEh5LegIw+kxeUAKJ4JKnpnqfiKUhmmRl0pLVBt7T4SwqnpULpulRnvjfRGARu0rSS+G3
 iqRHyntKJCm+WHr7NQvBnNhkAtY5lXwGSVmrE4ESxYC+U1WzEkiRPy74TZIvTeT1cD/jtp8Xh
 2Yx3erFonExfE3nqyco3bfva6sfw/Dd96StTSWfi7xUkbUvCwCO8vDpKgBwZDlR9U1MCDuxdy
 jNWXF79sbPI/noV0T390ejgSmKov16HQt/aBzFVp232l5W5KTFFlhAFYTRxYuG22q/JfLbL54
 ERnHE6z787PtPfnrrFTfxjTcgJyoSDiq2EYCK6P2wwe7MzLGkmHHCbxNb89nyY3Arbx9w43WR
 2/CqW/gAg13Ov0KcC/LcJRDjTSXDkpMCroo0BkTqpKD1dwDSVt/op7PiyWHVJavjZEax2qxWG
 gJ7jyMqJfKYiEGAYjtTQ==
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <SC13VlQhecN.A.r-H.IEFGgB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1112
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/ebe7beb2-336d-35d4-48af-8f8cad7b868b@web.de
Resent-Date: Mon,  1 Feb 2021 19:05:44 +0000 (UTC)

=E2=80=A6
> +++ b/drivers/block/nbd.c
> @@ -2011,12 +2011,14 @@ static int nbd_genl_disconnect(struct sk_buff *s=
kb, struct genl_info *info)
>  		       index);
>  		return -EINVAL;
>  	}
> +	mutex_lock(&nbd->config_lock);
>  	if (!refcount_inc_not_zero(&nbd->refs)) {
> -		mutex_unlock(&nbd_index_mutex);
> -		printk(KERN_ERR "nbd: device at index %d is going down\n",
> -		       index);
> -		return -EINVAL;
> +		goto unlock;
>  	}
> +	if (!nbd->recv_workq) {
> +		goto unlock;
> +	}

How do you think about to use the following patch variant
(so that unwanted curly brackets would be avoided for proposed single stat=
ements
in two if branches)?

+	mutex_lock(&nbd->config_lock);
-	if (!refcount_inc_not_zero(&nbd->refs)) {
+	if (!refcount_inc_not_zero(&nbd->refs) || !nbd->recv_workq) {
+		mutex_unlock(&nbd->config_lock);
 		mutex_unlock(&nbd_index_mutex);
 		printk(KERN_ERR "nbd: device at index %d is going down\n",
 		       index);
 		return -EINVAL;
 	}


By the way:
Would you like to replace the following two statements by the statement
=E2=80=9Cgoto put_nbd;=E2=80=9D in another update step for this function i=
mplementation?

		nbd_put(nbd);
		return 0;


Regards,
Markus


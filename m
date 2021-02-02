Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F1E830C97E
	for <lists+nbd@lfdr.de>; Tue,  2 Feb 2021 19:20:10 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 444D320761; Tue,  2 Feb 2021 18:20:10 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Feb  2 18:20:10 2021
Old-Return-Path: <Markus.Elfring@web.de>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=4.0 tests=DIGITS_LETTERS,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FOURLA,FREEMAIL_FROM,
	LDOSUBSCRIBER,MD5_SHA1_SUM,MURPHY_DRUGS_REL8,NICE_REPLY_A,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL
	autolearn=unavailable autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 5640520752
	for <lists-other-nbd@bendel.debian.org>; Tue,  2 Feb 2021 18:20:00 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-2.778 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1,
	FREEMAIL_FROM=0.001, MD5_SHA1_SUM=-1, MURPHY_DRUGS_REL8=0.02,
	NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
	RCVD_IN_MSPIKE_WL=0.001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id vz7YcbCR65Xi for <lists-other-nbd@bendel.debian.org>;
	Tue,  2 Feb 2021 18:19:55 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from mout.web.de (mout.web.de [212.227.15.14])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 822D3206A9
	for <nbd@other.debian.org>; Tue,  2 Feb 2021 18:19:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
	s=dbaedf251592; t=1612289985;
	bh=/G0++4zeOkTc7x4KXf2zWeP0tAJCik4m/rgBPLIfVus=;
	h=X-UI-Sender-Class:To:Cc:References:From:Subject:Date:In-Reply-To;
	b=JjVyPCEzrBNNN21UvTy/iEd2dy+GI0bAsR+36qImeL7u9pXlZx9QBiVVfgubU5rH0
	 w5E0wY+nFcwAV9qp7mu+hSo+/gMeTFZ4anGfAqVXAsKjrxdC76SQ27gTExB4yngTcr
	 5KVe49PfagGB4kUKH5FUSDi2EnMn7lkMWUc1fuyQ=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([78.49.121.237]) by smtp.web.de (mrweb004
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0Lex9L-1ljelK0YTn-00qezT; Tue, 02
 Feb 2021 19:19:45 +0100
To: Sun Ke <sunke32@huawei.com>, Josef Bacik <josef@toxicpanda.com>,
 Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org,
 nbd@other.debian.org
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
References: <20210202021508.1319706-1-sunke32@huawei.com>
From: Markus Elfring <Markus.Elfring@web.de>
Subject: Re: [PATCH v3] nbd: Fix NULL pointer in flush_workqueue
Message-ID: <992600b7-0431-b013-24cf-3eef832a987b@web.de>
Date: Tue, 2 Feb 2021 19:19:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210202021508.1319706-1-sunke32@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:F+df3gL5M0wa5I5aTUAyRGs2qVk9Dp0thiZ6tfPaM3Ivyum5URx
 XobuGDnAVaTKcwaB81tHXoybzNKnanwH/sMsBMGUW5rlPnnNKD7lscg4wKXyKQ/MUu210Rc
 Xx7br7Ao/IvjP3gi36Q6Bw4B3FS560goAdjiNjJs3IH/+vTMiHGE/6Zh/e02fX5UihebL6C
 eBL2U0z2V6/oE0AgVeSxA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:0lZ2xYNNd+I=:EYQP7mI0TddziEh67/jbqH
 jVdVGYIgGlKDf1f9bolODmW4cwkWRYrUPZrAj32yKt6sNEWqMedydx2soMeexoXAg3AKJSYDZ
 JlsaYpg2WrhmtRvsaU3M6+sx4oPMUSAy1IhOXOf6c2IcKlTyhE30gZG3UtamohqMFwOmgQC4S
 hgZW7pV3kZtVhoRyNxEet66IDL/WwU8SmIibPIVn4ZREAzvV+FwGXJNUfee2wUxIozOsRqHLF
 W1/ekO1Q2mI8R47fNh7guasRIIQbOZyqTEn3C3cEI8+smQPMwXeSSTyLjedln+b4ZHbeOczj6
 lusYMgJFEkBWyEEmmVXIM7lEXj+kqGdLfc0VOQE4TGxteZQq7QzmPJoZVX3FjYIdJrSR+c8n6
 n5041O6mgp+OwHHaYWBiOw+CUayg5KsmCO2RtmhBAoaS7hW4ageOnO0lIk6UoSIi3gSHj+mAE
 v0SgETC4lbUJMaPTlXP2vgSQPo4UqBMaH81YLBC2I432RX5DlxyBCU2+KwduRnBpEU80KUGM4
 9fEXzLBktPDMa0hmVTeb/hVYmei74jzugtZzcQBsTQsBj15+kePV5TgzhhWwo/8VZKSU5PCnh
 HxMDes2/AqfA3Ej8UFGvMEbljpCTTOyQ6ZE+sezsLzugozkAX5rxcCIZoHfVLXY8+e/eH+olN
 qvPW5IOKHsdc5sfUf2UZfG7DSbs7zn0zFYC7tS324ww+E8cMYFNCYc2AQbdL4hxXe3L4A/ocz
 7ay2ZApSU3TiJXXbBpFYm34nAUDu4dZ4nPyhWm83TgyXG5R8yKndT5SrKj8QRd9VdSYrlTc4I
 WHex8MtKzSqyPv50TP2bQWSFPIbZXhQvB/LExQ54oVzqU8ef0OfjDYqx7RB83PlA/rKXSrhMW
 HNcr8QE3Ndeo6pMOb1qw==
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <3tZQePr_OjI.A.ayD.afZGgB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1116
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/992600b7-0431-b013-24cf-3eef832a987b@web.de
Resent-Date: Tue,  2 Feb 2021 18:20:10 +0000 (UTC)

> v3: Do not use unkock and add put_nbd.

* How do you think about to avoid a typo here?
* Can such a wording become clearer another bit?


=E2=80=A6
> +++ b/drivers/block/nbd.c
> @@ -2011,19 +2011,23 @@ static int nbd_genl_disconnect(struct sk_buff *s=
kb, struct genl_info *info)
>  		       index);
>  		return -EINVAL;
>  	}
> -	if (!refcount_inc_not_zero(&nbd->refs)) {
> +	mutex_lock(&nbd->config_lock);
> +	if (!refcount_inc_not_zero(&nbd->refs) || !nbd->recv_workq) {
> +		mutex_unlock(&nbd->config_lock);
>  		mutex_unlock(&nbd_index_mutex);
>  		printk(KERN_ERR "nbd: device at index %d is going down\n",
>  		       index);
>  		return -EINVAL;
>  	}

Can a bit more exception handling code be shared for these if branches?

 	if (!nbd) {
-		mutex_unlock(&nbd_index_mutex);
 		printk(KERN_ERR "nbd: couldn't find device at index %d\n",
 		       index);
-		return -EINVAL;
+		goto unlock_index;
	}
+	if (!refcount_inc_not_zero(&nbd->refs) || !nbd->recv_workq) {
+		mutex_unlock(&nbd->config_lock);
-		mutex_unlock(&nbd_index_mutex);
 		printk(KERN_ERR "nbd: device at index %d is going down\n",
 		       index);
+unlock_index:
+		mutex_unlock(&nbd_index_mutex);
 		return -EINVAL;
 	}


>  	mutex_unlock(&nbd_index_mutex);
> -	if (!refcount_inc_not_zero(&nbd->config_refs)) {
> -		nbd_put(nbd);
> -		return 0;
> -	}
> +	if (!refcount_inc_not_zero(&nbd->config_refs))
> +		goto put_nbd;
>  	nbd_disconnect_and_put(nbd);
>  	nbd_config_put(nbd);
> +	goto put_nbd;

Please delete the extra jump which I find questionable at this place.


> +
> +put_nbd:
>  	nbd_put(nbd);
>  	return 0;
>  }

Please move the part for such a source code adjustment to a separate patch=
.

See also:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Do=
cumentation/process/submitting-patches.rst?id=3D88bb507a74ea7d75fa49edd421=
eaa710a7d80598#n76


Regards,
Markus


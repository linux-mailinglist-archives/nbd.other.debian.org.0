Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 78D42C2668
	for <lists+nbd@lfdr.de>; Mon, 30 Sep 2019 22:12:48 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 622012055C; Mon, 30 Sep 2019 20:12:48 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon Sep 30 20:12:48 2019
Old-Return-Path: <asml.silence@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,DKIM_VERIFIED,FREEMAIL_FROM,
	MURPHY_DRUGS_REL8,PGPSIGNATURE,RCVD_IN_DNSWL_NONE,TO_TOO_MANY
	autolearn=unavailable autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 905EB20558
	for <lists-other-nbd@bendel.debian.org>; Mon, 30 Sep 2019 20:12:41 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-6.179 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
	MURPHY_DRUGS_REL8=0.02, PGPSIGNATURE=-5, RCVD_IN_DNSWL_NONE=-0.0001,
	TO_TOO_MANY=1] autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id 5ARwuwrP4955 for <lists-other-nbd@bendel.debian.org>;
	Mon, 30 Sep 2019 20:12:37 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1O1" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id BF6AF20548
	for <nbd@other.debian.org>; Mon, 30 Sep 2019 20:12:37 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id r17so843287wme.0
        for <nbd@other.debian.org>; Mon, 30 Sep 2019 13:12:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:autocrypt:message-id:date:user-agent
         :mime-version:in-reply-to;
        bh=LhVmXhOVEHC9tT9BG7DdK/Rr0Wh9e9NBgmSaanxTpvE=;
        b=p5vr7senV050syAyRBDkWc+t7zjYBeGe/57nEwrQXjWpJtHsPmCFwEqp4fERG+XyXv
         A9LGuIUJJlMzqu34IeqE8W8mc6K05XggT7mQZKt3TV5/pGTIzFbn2WBH/RCG8NtA+ARw
         QeB44KOwq164R7Xe8OE7ZBi2Y3ECYJTkl4oVXXmottrMW04CggTzZ2nRa8pauiRn4yyl
         nlCeMgBUNa3PmX60SnmuFKSEW4SMVpwclkLtG4xMr7DShpYMu0CDNR5vyfY5atZ+OGyD
         Wg6Qbp5W/z+IHZxdm5b1OINFZ8FtHzrHcYtKw3ldq9kX7BdytzGnomyw3sf8yKY5+6nc
         cBHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:autocrypt:message-id
         :date:user-agent:mime-version:in-reply-to;
        bh=LhVmXhOVEHC9tT9BG7DdK/Rr0Wh9e9NBgmSaanxTpvE=;
        b=DJRcD0bG+i9NCmjFs0zDX7VcazCR0QYa4n9TbH8JXOQDFbzNxKa0FfRtfKy2O3WXzt
         Uj9hPqLELBakg8gO/kCDAD4F1+7eVNpQsUBvMdSewnUrcxniYsJZQ7WUhOaDzIm8Ujmu
         0zSMPHLIGmxhUla8gqm5pJgz4g7qzETmkL0atbN8c5EJAS43qDmBA4IzN14qx6ysGsFt
         moLGoN9rxTCMd0RyZMSCQ0xd+VKsvVwS90FBkNrUls60mATQPJA6TAGGq6X4BchIXrSz
         xhsy1i0NYKfRY1vl+QMxQCDy9OojQo3fQ8VbAF6qNiNeBUomwOBj7pGozAy5xEK/S8Ri
         6RtQ==
X-Gm-Message-State: APjAAAXKvfnPJ79It55IGc1EJGH5hf/Py/HpEAjKGCoV4E8meRF3MsLH
	4/iZj6dt8S79BjoWoTpzm0k=
X-Google-Smtp-Source: APXvYqyV9Gqn+dR8/XONeLzXgsqH+eQ5ZHxrJFjFQOSPl8qzI3JBlRQjBBDk8Z4otsAN32dzi2N4Xg==
X-Received: by 2002:a7b:cb91:: with SMTP id m17mr661542wmi.151.1569874355332;
        Mon, 30 Sep 2019 13:12:35 -0700 (PDT)
Received: from [192.168.43.187] ([109.126.142.9])
        by smtp.gmail.com with ESMTPSA id t6sm1054080wmf.8.2019.09.30.13.12.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Sep 2019 13:12:34 -0700 (PDT)
Subject: Re: [PATCH v2 1/1] blk-mq: Inline request status checkers
To: Bart Van Assche <bvanassche@acm.org>, Jens Axboe <axboe@kernel.dk>,
 Josef Bacik <josef@toxicpanda.com>, Keith Busch <kbusch@kernel.org>,
 Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>,
 linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
 nbd@other.debian.org, linux-nvme@lists.infradead.org
References: <1cd320dad54bd78cb6721f7fe8dd2e197b9fbfa2.1569830796.git.asml.silence@gmail.com>
 <e6fc239412811140c83de906b75689530661f65d.1569872122.git.asml.silence@gmail.com>
 <e4d452ad-da24-a1a9-7e2d-f9cd5d0733da@acm.org>
From: Pavel Begunkov <asml.silence@gmail.com>
Autocrypt: addr=asml.silence@gmail.com; prefer-encrypt=mutual; keydata=
 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 bA==
Message-ID: <6da099e2-7e29-3c7b-7682-df86835e9e8c@gmail.com>
Date: Mon, 30 Sep 2019 23:12:31 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.0
MIME-Version: 1.0
In-Reply-To: <e4d452ad-da24-a1a9-7e2d-f9cd5d0733da@acm.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="giH3IsFqshXvGfS4YzqoHs9szK5RNcxbS"
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <njm4ZInjwlK.A.aHH.AHmkdB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/699
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/6da099e2-7e29-3c7b-7682-df86835e9e8c@gmail.com
Resent-Date: Mon, 30 Sep 2019 20:12:48 +0000 (UTC)

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--giH3IsFqshXvGfS4YzqoHs9szK5RNcxbS
Content-Type: multipart/mixed; boundary="yFWnF8paxgog3cX5J4qDqtERPn2AkJH9U";
 protected-headers="v1"
From: Pavel Begunkov <asml.silence@gmail.com>
To: Bart Van Assche <bvanassche@acm.org>, Jens Axboe <axboe@kernel.dk>,
 Josef Bacik <josef@toxicpanda.com>, Keith Busch <kbusch@kernel.org>,
 Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>,
 linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
 nbd@other.debian.org, linux-nvme@lists.infradead.org
Message-ID: <6da099e2-7e29-3c7b-7682-df86835e9e8c@gmail.com>
Subject: Re: [PATCH v2 1/1] blk-mq: Inline request status checkers
References: <1cd320dad54bd78cb6721f7fe8dd2e197b9fbfa2.1569830796.git.asml.silence@gmail.com>
 <e6fc239412811140c83de906b75689530661f65d.1569872122.git.asml.silence@gmail.com>
 <e4d452ad-da24-a1a9-7e2d-f9cd5d0733da@acm.org>
In-Reply-To: <e4d452ad-da24-a1a9-7e2d-f9cd5d0733da@acm.org>

--yFWnF8paxgog3cX5J4qDqtERPn2AkJH9U
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 30/09/2019 22:53, Bart Van Assche wrote:
> On 9/30/19 12:43 PM, Pavel Begunkov (Silence) wrote:
>> @@ -282,7 +282,7 @@ static bool bt_tags_iter(struct sbitmap *bitmap, u=
nsigned int bitnr, void *data)
>>  	 * test and set the bit before assining ->rqs[].
>>  	 */
>>  	rq =3D tags->rqs[bitnr];
>> -	if (rq && blk_mq_request_started(rq))
>> +	if (rq && blk_mq_rq_state(rq) !=3D MQ_RQ_IDLE)
>>  		return iter_data->fn(rq, iter_data->data, reserved);
>> =20
>>  	return true>
>> @@ -360,7 +360,7 @@ static bool blk_mq_tagset_count_completed_rqs(stru=
ct request *rq,
>>  {
>>  	unsigned *count =3D data;
>> =20
>> -	if (blk_mq_request_completed(rq))
>> +	if (blk_mq_rq_state(rq) =3D=3D MQ_RQ_COMPLETE)
>>  		(*count)++;
>>  	return true;
>>  }
>=20
> Changes like the above significantly reduce readability of the code in
> the block layer core. I don't like this. I think this patch is a step
> backwards instead of a step forwards.

Yep, looks too bulky.

Jens, could you consider the first version?


--=20
Yours sincerely,
Pavel Begunkov


--yFWnF8paxgog3cX5J4qDqtERPn2AkJH9U--

--giH3IsFqshXvGfS4YzqoHs9szK5RNcxbS
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE+6JuPTjTbx479o3OWt5b1Glr+6UFAl2SYbMACgkQWt5b1Glr
+6WvUQ//dfXUMpW57TrpOqbEeQnQQeSCHCtExjGOorPamQfnaIYf6T4v8sfs09lZ
63atGXZQNSTQ+nFLeMDz9CxpWov6ZD8mknAa/JJ5U2gG5yHoePZ4+0SoEXV0t90D
egyaNUbMH4jl1uOWESpdiDdLSpHBimUpyfHzxaLCYFTW2/h/Xmymwdi87NSChTZt
PXuwPjXWY/EzR4HN1nxIy9AmRtgJwjvRhAyQyzafsGuOP+s0GAP7Q2GdCukWqo4N
yAT3jHjrZUrQNab3uqealhlpzMgw5wlm00IccWxOqulbYoCVIJXh4oPOZr28h8Nq
d+T9MyWION4ym2L2c0NvmLYKuxODOZvLwp/nbvX0hjrDhJ1DZjv2WE4kTIhcxDse
sRmU9AeMjSnm4X+SCZNaQi5j3D5sICStJquGPoPi0eGSMClDgmU6vOPZQTLDi1M4
MF+hgXCC1QeJbIsvUkoKdN1aBSkP4cGAqD593K5rXCz0+Mm+EmvRF+euEOi5ZaBn
VdcMYqCWcbCkr/2J/RJ6blxPAHTO+VDpmLLmW1G91KcP5wmTGPj/Lf99LvuBJ1hs
xTK6AZZ0T+gY4rdVHCKuiqmcXWoicH7Xk+hbWa65TVPCswH4xGqQ92xj1EMFke4C
Drn3/CSkF65+dpGxBqJbw+PzST0BPGS7wweb9rUI6htVDklOJN4=
=BwjS
-----END PGP SIGNATURE-----

--giH3IsFqshXvGfS4YzqoHs9szK5RNcxbS--


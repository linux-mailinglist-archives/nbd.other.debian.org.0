Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id A40FF30AEB7
	for <lists+nbd@lfdr.de>; Mon,  1 Feb 2021 19:06:14 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 87B91205D8; Mon,  1 Feb 2021 18:06:14 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon Feb  1 18:06:14 2021
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
	by bendel.debian.org (Postfix) with ESMTP id 79AE3205CB
	for <lists-other-nbd@bendel.debian.org>; Mon,  1 Feb 2021 18:06:05 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-4.026 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, BODY_8BITS=1.5, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1,
	FREEMAIL_FROM=0.001, MURPHY_DRUGS_REL8=0.02, NICE_REPLY_A=-2.749,
	RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
	RCVD_IN_MSPIKE_WL=0.001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id 2g3A8wtb04io for <lists-other-nbd@bendel.debian.org>;
	Mon,  1 Feb 2021 18:06:00 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from mout.web.de (mout.web.de [212.227.17.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 9927E205C0
	for <nbd@other.debian.org>; Mon,  1 Feb 2021 18:06:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
	s=dbaedf251592; t=1612202749;
	bh=J+S6xhO6bVNUqILZvVHTfxZQso0EaKYCoA6AqdX+SBY=;
	h=X-UI-Sender-Class:To:Cc:References:From:Subject:Date:In-Reply-To;
	b=sx01W7HO4DcN3F3YcXhqIMgpywt6BQys+bnVU8idZadFo+OHAiwfiwWGw8WEtxEfF
	 6tQo3YLcF5nqFiJPXap6qU6Oi/5Ujt29V2+wkKw0Y3lUEjiPEU8EQ/CfBdHNcySCGZ
	 wbhue7BZ+Xovb4744C4mip8B7yUnHYHa3nb/f75k=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([93.133.98.46]) by smtp.web.de (mrweb101
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0LnB1F-1lamKO2pK9-00hNFb; Mon, 01
 Feb 2021 19:05:49 +0100
To: Sun Ke <sunke32@huawei.com>, linux-block@vger.kernel.org,
 nbd@other.debian.org
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
 Jens Axboe <axboe@kernel.dk>, Josef Bacik <josef@toxicpanda.com>
References: <20210128074153.1633374-1-sunke32@huawei.com>
 <1739e522-5980-f86e-cb90-19b61539a5cf@web.de>
 <28c83b00-7d0b-ee0d-640b-017c9f8410eb@huawei.com>
From: Markus Elfring <Markus.Elfring@web.de>
Subject: Re: [PATCH] nbd: Fix NULL pointer in flush_workqueue
Message-ID: <1e4bfd85-caea-f248-7028-b5455bf30c5f@web.de>
Date: Mon, 1 Feb 2021 19:05:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <28c83b00-7d0b-ee0d-640b-017c9f8410eb@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:9cA0AGOgDb3u0+6Sdtzu9tOc1Os0hKmSp375eK37AL/LMyeYjj0
 ZhzpwauajJf7xlglwDjxB+e3r1LPHij/VPqGE8O64uF7fTkOxteVb5sJT43aSPcR3M3H2iK
 2frKIkowSTXazqYL9g4jYytW9AO+4rYo0duSmk1l9/wJSuc1dTh9KfrPlJn0lMYU1Q9L0wA
 SwSkTQ1a1qoV09zDbJ9Uw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:ikD9ll+L9nI=:oD2zOqJd3P1kmB1kcvP/YS
 gSNB1oFApgs7UOI3gGnp3EYI7Ty+0tLa5I/H6uc3asZfQlYepBel9FBGn8JMZfuPZXGFFzZU4
 Zmg6wBWP3YeWAda+keJug+srHSBsIaluuibfDDUkpB46f5xXyLa/XeN8yiqRBO7dFqMbzHGgB
 uGBxpdjz9yDmQl0aileFsKvfkVN1zAoLanUbO7HwMUhjaembk0BWVk4seIh2zD9doYq8Duxjp
 EzQCNMiWJeFDMQ4b3iwwtbSGe57wnHgTQSIZOFFMeB1iJGvD6gl1tJ2F9r3vdYp480UK1d2lG
 X6lg/Hl6Q3EC+ECQ1djhCm//lOlKLMADbB3C5sUqjl98OTSd7x3DdhnZw8AXw/TpDU8fTcZKI
 0ulqfRC7ob/u+ApfiOF/c9Gq62W7ck+P0rWav0wg3l/NQOO300epx0+H4qUBtdy2tifLWMlnL
 FYBgH5SKzJE++GfFAUxcJAbDoS8HMa1cu1LzhcYGkAZmG0Y8wu0F6JWHBeTUSAUG1ESI6ydjP
 oOtvGEqw16rl7Jk/NHnqEpjw2OoRRq/Bwf3G49JeAQ9cfu7XBwBQO7oHECDCSBiGE/UHgcv5+
 2UQ1jFZVhWLTH09BtDwBmg6tD0kV7Zha3iK1mtsreuZGv/VbhHLf++OKGBECGhc906jgpEXxh
 JN4oZbx5k6iZwJe6LVlubfU07MLayHBxinU5eGltnOg0Bst/K32SyVMCcFt9bTFQKM7mgd4ys
 B1BAOO0WomyhMBM+tj2fs7d++cJFgl4qDOt/MSvLMa2ZDd/khHYtH34xTuO8EKSndUwMqTG3x
 cWbvxFB3+5UYxBm1vsjlUCgpIXkmy60zYHnioq+nDHdJHo+g1DPNCXRlemTp/Se4C22vDO95M
 dX7NUAx+Cl32YjzPFxMA==
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <e2iYjEUjzzF.A.g9C.WMEGgB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1111
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/1e4bfd85-caea-f248-7028-b5455bf30c5f@web.de
Resent-Date: Mon,  1 Feb 2021 18:06:14 +0000 (UTC)

>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!refcount_inc_not_zero(&nbd->refs))=
 {
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mutex_unlock(&n=
bd_index_mutex);
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mutex_unlock(&nbd->config_=
lock);
>> Can an other function call order become relevant for the unlocking of t=
hese mutexes?
> Do you think the nbd->config_lock=C2=A0 mutex here is useless?

I proposed to consider the possibility for an alternative ordering of unlo=
ck calls
once more for the implementation of the function =E2=80=9Cnbd_genl_disconn=
ect=E2=80=9D.


>> How do you think about to connect the code from this if branch
>> with a jump target like =E2=80=9Cunlock=E2=80=9D so that such statement=
s would be shareable
>> for the desired exception handling?
> OK, I will improve it in V2 patch.

You have continued the software evolution.
https://lore.kernel.org/patchwork/patch/1373539/
https://lore.kernel.org/linux-block/20210201081918.558905-1-sunke32@huawei=
.com/

Regards,
Markus


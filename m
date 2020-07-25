Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id EF53922D6E2
	for <lists+nbd@lfdr.de>; Sat, 25 Jul 2020 12:50:54 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id D5B3A203FF; Sat, 25 Jul 2020 10:50:54 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Sat Jul 25 10:50:54 2020
Old-Return-Path: <Markus.Elfring@web.de>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,LDOSUBSCRIBER,
	MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2
	autolearn=unavailable autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 7F50C203F3
	for <lists-other-nbd@bendel.debian.org>; Sat, 25 Jul 2020 10:50:47 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-2.88 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
	MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_LOW=-0.7,
	RCVD_IN_MSPIKE_H2=-0.001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id SWoyhHy9Zl4r for <lists-other-nbd@bendel.debian.org>;
	Sat, 25 Jul 2020 10:50:43 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from mout.web.de (mout.web.de [212.227.15.14])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 80395203ED
	for <nbd@other.debian.org>; Sat, 25 Jul 2020 10:50:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
	s=dbaedf251592; t=1595674230;
	bh=AnGv9cWvi54PTE4qUiwmpJgilT77DJk3ggZXrzH/RDI=;
	h=X-UI-Sender-Class:To:Cc:Subject:From:Date;
	b=bz0MdmxeS1kJSd8odomdpkrnUukYKsIctkY/wSP36WkKCbOeWBcRtbbpENhIPGLwh
	 Nz9LlWJhPlpJ5NwO992xaIsKzZBsLy7CY67zs7OkH5cpyxxjkLC4qNKvAq9MqdZFXy
	 HhP24PhQOmhRB7+1bTbARk8smEae8XYQeWUk11jU=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([93.135.94.55]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1M2xrs-1jvyNG2vgC-003Q9K; Sat, 25
 Jul 2020 12:50:30 +0200
To: Li Heng <liheng40@huawei.com>, linux-block@vger.kernel.org,
 nbd@other.debian.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 Jens Axboe <axboe@kernel.dk>, Josef Bacik <josef@toxicpanda.com>
Subject: Re: [PATCH] nbd: add missed destroy_workqueue when nbd_start_device
 fails
From: Markus Elfring <Markus.Elfring@web.de>
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
Message-ID: <d7b60d29-4a02-ae2a-fa9d-0c4918eba91a@web.de>
Date: Sat, 25 Jul 2020 12:50:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:hleuPqUzD+dDoJhRdlhRKzMh/C+nunVKjL7cUSKPetW2aG9Rr8K
 j18eXSTeRevigNyUMsUvQzsQDmC9GT8B5Ty64Y6etr+Tt8Bm5XmEhV7Zh+vOEhttOApmD/2
 nO/OIxqeXhZKX0PtszyFzB6fR6n+f0km9eQF4R2qH0l28YFH5phaKXSZCCU1rhYztbhu41m
 Kr5rrxuJjhycJ/fQxEPEQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:DKSK7Ph4Tko=:1hWy2Q8K4+yAAcfxEOe358
 ydGMr4ewOgxRWSpOUZxkRY1b41ha1a93p0myi1apD3eRtu6l57bDZ80nJcEqg0I5n2dNHuWxI
 JxBG1TP69j4fnupQWwAZGxnwuZIIAFQ66dW4Lf8IOVkzn6HT+8RtVoCkoYM+Nb+uf5DtPcxol
 MTy9CLD/OF8USvuFjmJq8o0+pdSd1nLV4aDaR9fDjswvdFV/EKLBNgkJ5nYnQSPxQphoRbR+G
 yEWW2xIWWZVG1xx8HmdmIY2OlIKKGDGEo13aPLPhR+/1i5IIm+3jxQojku7qKZMKvPbiluAUR
 K9L+bcPl0GFLcTJgFrswhhyVAFi3lV1HSUfsAxDRcBreFWsHTeepUc6YINkL7IH767sHMl+mP
 Y5+pdZMK08cf1nVKzpUK88s8tXAuOJCMj0t8gEfvT5kMKRObeACexazsngoIXcTdQEDMgGFMG
 F0ew/jItnVcoJ9Cc5Z1wKdXXMn3AwG47JCjrY0zmA7NzwI/1Ch9NwtiHoSqPyn6/NzdXxaZk+
 vsFcPI9OGDKb+c3BgTsT2s3uPjoWmfkuxZLZcwaEt07PFksRJFPMXX8bCRw7fNYba4hRlpwpX
 0Gg4Dj9/EGXqyX78yRui+IVSaPbUMKmnUO6t1nBjHyW4dhxmOhziqyv0NkP6YGLpqg0E52wu7
 4ajX2em+UBKOy3ds7pJ8gd/rSXsBv1ZRmehHI/4MwhjkftQeOjJ0ubTT4hK7V4V9ljAemEJOn
 97dA1poLaVZsRbwMY3Wik078iSSpinSKp+wl728n+L/AhpzuILl/qCsC5kTepFnMiNMle5YPb
 Xehe95Es8CGtyeBCyTwqfm2plj4twffQXubv2bpsJsqYVOozhXvE288aVOf46JVkgsK4SY+g9
 UlSlsH9mPnhlj5T5zrL80t6kSPdlN1xowqcSwjM5lmrxm1xsrxdBg/q1kfu7MhmMazeC0Mwnl
 g/h+LeHboqixIMxAUJ2DliEG8KWBHnPbpkZXuChM5lDFZQe2Zi0Y4RzmW3sFJnrvK5uc36faw
 Txly/8+Z0EQtoVRWqqyj0pxgxkRBkiP4MRj16SgXSUb7UfHG/slsnIPeZq4hIV0sjnv4t0l9f
 xdcB8XkNo07ZXr7bqVYS2l33chRoqwv7FHLTVouLYnDxfqvKtjH1MQz8fEJHHfPuJ/tCVdnhS
 Vpz8vub6KEXe2TyZSaKBS16jyVcwf9QRktMFjAmGTrN5TUsroasNIPRSWKROLTmiwWa0pgAPh
 A7KY94os6iiZJlJSJzSta6dcws6ubBTkn1L/y5g==
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <e9hPb6GylNI.A.4l.O6AHfB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/924
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/d7b60d29-4a02-ae2a-fa9d-0c4918eba91a@web.de
Resent-Date: Sat, 25 Jul 2020 10:50:54 +0000 (UTC)

> destroy_workqueue() should be called to destroy ndev->tx_wq
> when nbd_start_device init resources fails.

* An imperative wording can be preferred for the change description,
  can't it?

* Would you like to add the tag =E2=80=9CFixes=E2=80=9D to the commit mess=
age?

Regards,
Markus


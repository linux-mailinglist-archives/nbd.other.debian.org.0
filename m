Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id D28BE203126
	for <lists+nbd@lfdr.de>; Mon, 22 Jun 2020 09:59:05 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id A55FC204BB; Mon, 22 Jun 2020 07:59:05 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon Jun 22 07:59:05 2020
Old-Return-Path: <Markus.Elfring@web.de>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=4.0 tests=CC_TOO_MANY,DIGITS_LETTERS,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
	LDOSUBSCRIBER,MD5_SHA1_SUM,MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_LOW,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL autolearn=no autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id EA3C62048F
	for <lists-other-nbd@bendel.debian.org>; Mon, 22 Jun 2020 07:58:57 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=0.123 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, CC_TOO_MANY=3, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
	FREEMAIL_FROM=0.001, MD5_SHA1_SUM=-1, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
	RCVD_IN_MSPIKE_WL=0.001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id vtxy81KfBMmj for <lists-other-nbd@bendel.debian.org>;
	Mon, 22 Jun 2020 07:58:53 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -5.5
Received: from mout.web.de (mout.web.de [212.227.15.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 4D6232044B
	for <nbd@other.debian.org>; Mon, 22 Jun 2020 07:58:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
	s=dbaedf251592; t=1592812721;
	bh=ZVSR5nyORNSx7+DWEx3pNcTs5a4pea2PQFI9qDf1fXs=;
	h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
	b=bOoUFgZ+y4i+pswzdqw9rzVIF169gFzRbg4ARWmsAaBnU376BguY0hohaTETwAhbD
	 MpNu7TP/iP53XW7S3nTPsPomSYib6Vzyv+3RPo5Ryqbqh8rndsE+kqVcABB41agoq8
	 SjGaR3JsEiIgpD+2usbRcYlxYcDpqcEs7egISa2s=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([78.49.69.81]) by smtp.web.de (mrweb001
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0Lilcj-1jHnuu1zVV-00cyRO; Mon, 22
 Jun 2020 09:52:25 +0200
Subject: Re: [PATCH v2] nbd: Fix memory leak in nbd_add_socket
To: Zheng Bin <zhengbin13@huawei.com>, linux-block@vger.kernel.org
Cc: nbd@other.debian.org, Aditya Pakki <pakki001@umn.edu>,
 Navid Emamdoost <emamd001@umn.edu>, Kangjie Lu <kjlu@umn.edu>,
 Stephen McCamant <mccamant@cs.umn.edu>, Qiushi Wu <wu000273@umn.edu>,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 Jens Axboe <axboe@kernel.dk>, Josef Bacik <josef@toxicpanda.com>,
 Tuomas Tynkkynen <tuomas.tynkkynen@iki.fi>, Yi Zhang <yi.zhang@huawei.com>
References: <b55f8af2-b20c-214f-90f0-9b6efcb7273c@web.de>
 <db17d022-a53a-3781-63d4-c38d5cf5b1e4@huawei.com>
From: Markus Elfring <Markus.Elfring@web.de>
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
Message-ID: <1a58ab81-3810-0763-7394-10b51add23ee@web.de>
Date: Mon, 22 Jun 2020 09:52:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <db17d022-a53a-3781-63d4-c38d5cf5b1e4@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:hCxjAKDqPmcYUqH74KGkP4kXff/2+FeIXCQvsDkz3oLMHfep4CW
 uFl8gaY4X8sqHgOooegig/rCLs6wkWyQuKFbRCmjNETGto6fQHx6V2UVmZNVlL+h4fpmrgC
 H2FrV80KSQStVdKN50Y3xwsoHnRbmWLbvcHF1JJGqSJCrLNo+72dYyVIcpIJg1nRYQ71csa
 G+0CjyKbzRKQbNYe2ZMAw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:HbwmPgLXZZg=:S5offQjkCGrxzbgLp8mp78
 IFT+ADBQLnnBVzQ/YJ0KlfLoDjREUO2VZtJqA/jjo3EQSMVp2CzJf7sd0EJqXJru+lPEuddfA
 D9aH5d7mZ8TRs6pcYiZISrDYjBzxqBKhj3SbbyXrGlX2QtTNHQt/3mdzSlxAp6B19cWVzOqhS
 X7DHLbTc9LSppoadEUatAOdnQI7NC1ihjirwW5NOvaBcOopFxFS9F2uOkHYhgxxh5o8sQqXP/
 iE6FrGO4UDgsYQVp/sQ0vnzepdymLaySJWq1eToVJPps35qW1KilccPVYNWd4E65ne9Geelwk
 6NLzvSGOkWn4n5TFyqPIATv4+65Gdvjc2HVlweu1JZgq/SBh8IRiaOhUU6yV7piP1jZ3TPVMj
 eJCA/89vK5KY8GWSq+cw4FOacl8dstNVKi3Bc0ZrH8shOvKfRlpKKr9prgKJWp+YCzY0gW41e
 yEi3waotOvRBCx5SuIxZl57vxGd7rA7kAvNbFOqNtjLLaaLpqfNHKS5oDpnbc3nyrRfJ2Eeo9
 Fe4JCvT2spRUMvDaX3yzcbViwD+ZAAl9NeeCWnIwSdOoGoZ3w3rapArsOw7wgogDMXrI/+fiP
 EXGxHm7kgsYQEuAkdNpaBgWFgPJCQbhRHkxupbloKKhae7kxOXdmy6XK1R6l1yTaN7Lum2Iuz
 qUsRzKGwBpwPtNfxyRP4ZAq+mSOl9ySWgMMrQYEokDuySXXN6K7JhcH/LXFSFVbHUD4DYD3Q3
 A5rnEsbIP92MkcAOC9vNbGdIseRURYB0zDqgLbGgv8nP5cBVCy1ECDCb89dBLCSBhxQHm/4sN
 fPya9ZP+EzfN3diLvDjlMuURu2GEg0iphwSNbjtj23VIhycc1C/vOSdoaqMRXhNN7m6j15Iew
 QZa3OCqUdKwLJD0wZdO7/rYaKSLMljVNFedepLyMho1K+KVJNgRRjmnzxcfmEqCV5hWZW38CL
 r6r84h6xJps3T7lyyENpOibI9QAsi+jaMWtf2CHuwP229JJ89m/UwpgE4OXT9kACTqkMLKtLV
 GtKhj8jktrUH14Uid2Ou8sWkhJE2XD0y6n8u/cdrCurYII6NxpJhcRJy/yXFUxRn48MFei1YI
 eQ8ug5xaAkcMlTfFeP/JSAoQrkLm6tB94hm77z68ui9jJRfQbi2kvcWeRN2zlYRbJaPdhMl1w
 DwNCtWhWJIc0tu+wJ444vMmvl7HCDCDSJs8Wb6bPpytwBIY6oGfEhuJRclMb7Zu+wiQRLSQMM
 ld9A9HsW/6MnbwcNt
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <8DToI1oJRbE.A.20.JTG8eB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/906
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/1a58ab81-3810-0763-7394-10b51add23ee@web.de
Resent-Date: Mon, 22 Jun 2020 07:59:05 +0000 (UTC)

>> Can an other wording variant be nicer?
>
> em, how about this?
>
>
> When adding first socket to nbd,

How do you think about to replace abbreviations by terms?


> if nsock's allocation fails,

=E2=80=A6 failed,


> config->socks is malloced

The data structure member =E2=80=9Cconfig->socks=E2=80=9D was reallocated.


> but num_connections does not update,

But the data structure member =E2=80=9Cconfig->num_connections=E2=80=9D wa=
s not updated.


> memory leak will occur(Function
> nbd_config_put will only free config->socks when num_connections is not =
0).

A memory leak will occur then because the function =E2=80=9Cnbd_config_put=
=E2=80=9D
will free =E2=80=9Cconfig->socks=E2=80=9D only when =E2=80=9Cnum_connectio=
ns=E2=80=9D is not zero.

Would you like to add an imperative wording to the commit message?
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Do=
cumentation/process/submitting-patches.rst?id=3D625d3449788f85569096780592=
549d0340e9c0c7#n151

Regards,
Markus


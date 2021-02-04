Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id AD20830FC06
	for <lists+nbd@lfdr.de>; Thu,  4 Feb 2021 19:56:59 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 6B61B207B6; Thu,  4 Feb 2021 18:56:59 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu Feb  4 18:56:59 2021
Old-Return-Path: <Markus.Elfring@web.de>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=4.0 tests=DIGITS_LETTERS,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,LDOSUBSCRIBER,
	MD5_SHA1_SUM,MURPHY_DRUGS_REL8,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL autolearn=unavailable
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id AD3BC207A1
	for <lists-other-nbd@bendel.debian.org>; Thu,  4 Feb 2021 18:56:51 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-2.878 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
	FREEMAIL_FROM=0.001, MD5_SHA1_SUM=-1, MURPHY_DRUGS_REL8=0.02,
	NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
	RCVD_IN_MSPIKE_WL=0.001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id 02wcA9QVe9l9 for <lists-other-nbd@bendel.debian.org>;
	Thu,  4 Feb 2021 18:56:46 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .web. - helo: .mout.web. - helo-domain: .web.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from mout.web.de (mout.web.de [212.227.15.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id B787D206FE
	for <nbd@other.debian.org>; Thu,  4 Feb 2021 18:56:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
	s=dbaedf251592; t=1612464996;
	bh=H0kMnjfY5gwbQsKkxPbhLBL4J0BIrn2p1Ez+auUftNw=;
	h=X-UI-Sender-Class:To:Cc:References:From:Subject:Date:In-Reply-To;
	b=RQILPN0xib6+jqnShD1rAALPVDGb61csiroBDRXtX728SBhZssA1kMZZImESrBawv
	 x6rhG2LY3Dh7FaKBsY/OpvSuQxN1sre2DvHNITCjJf+LWN9ZRb5wrvs4mWOH3ZeXv8
	 eOql8gRKhI3e3/3TwSE+zVHsQhz28opGrN0WSKH4=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([2.243.112.112]) by smtp.web.de (mrweb004
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0MBY4U-1lG1Wk2XmI-00ATY8; Thu, 04
 Feb 2021 19:56:36 +0100
To: Sun Ke <sunke32@huawei.com>, Josef Bacik <josef@toxicpanda.com>,
 Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org,
 nbd@other.debian.org
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
References: <20210204070910.1401239-1-sunke32@huawei.com>
 <20210204070910.1401239-3-sunke32@huawei.com>
From: Markus Elfring <Markus.Elfring@web.de>
Subject: Re: [PATCH v4 2/2] nbd: share exception handling code by goto put_nbd
Message-ID: <575a2a39-740d-e24f-3e24-f1693f0bd3d5@web.de>
Date: Thu, 4 Feb 2021 19:56:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210204070910.1401239-3-sunke32@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:YQa/+F3vbuDQ0ippqAtmpj2g3hsyuHy7Wngy/yzVQ0r0+7TDEVD
 4Xct+EUwuWGTR67aQ1WwLUJbLNiEeZ4czlNMfwps4z231EDp4fTRfQ+r0f3WDelE620ihB5
 Z05FAPx6I3p7gC/smIxvwvc/PEP7PAqOgN3fmQly1BNjKQ+LNlQP5AsgVqfDX2jfb8L9MIh
 vjrRnL5y1oa4XeezD+BnQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:26OfMuQD1AM=:pVksNfaE1or6lC3mOG8vNC
 XJz+TxInkFSsVCZtTmXUWMLQcFv+bMjhNn0hLPbwA3/UPLkN5SwPLlVFiTsQq8jhavfzvqhEw
 vmknL2uRCfTwCAdJ1kqrbeG43nN9t0dDaIPO4EuV4j4uT5XJIVT3VQAB1wSBUwtldfvW3Af3B
 RgXP7JEtlmrWtMFszlBzrReskp9/fZ9Wb6xDYiANWQQ5UWDVATk7RmQxVBjNlL1zIw9EONJDT
 B6Rpy/veficquH+2HYkek8x1iSvcGOf/4QGcdwJhEY/W9iRtCOuWMduH3JyPTOwrIYtdFEed0
 7FM23abOFuTI0RGIi45KDbTbt2ppTdiCNToUBhlUU8zhJ+BZU/3uW2a/qZa6qajLY3MCWnoDM
 j0iIQZjH85s2AdLAMGDwl+3mOXApG0JyfydWbJOvzFURyfKxgIRPl/kTbIoaQfscvtRf+N9Uk
 6Qe2UvsJXM9dvqFu76ZUJKaBc26AN3gve3Az4R/AhWh5UnZtr+LAEtUXxKkFUZxsXV1b1+pAf
 PSPKj4Bns9SniWlmLKIA8FNL8PnMJQC6eOpGkXnK6f3db4TTYLPFezU4Mwjt8VLP2KrQWVbjL
 29L3c9pxaVYjG/X4MKqSElu+lRWrb9HfpBwgitE1T0Zr5Ot8VXN2qyJyz+1PlPUY4HpCK1iLr
 s7eEoMw9EZl3Ami8CqhWktPdeiWH87AK+gleIhsdgTSvi1MdTd7Kehlj6oL7OcGaulHcrSxRL
 yrMIPxL4IhmntwQm2HGfBO3AmCj5YK3xV8rIgnowfPOKP7C033QZ600RIG/teo9iOyAtCVtlI
 oIQtTW1yWDA0MgQ2g6eGx7wA7or+umLOcoa+biQ5Bgo7183kyUZOxEcohrTBkwC/a/Ul1DG+l
 u/Qd+X7evjHdljXA/B5A==
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <Va2lQBuEPZ.A.kH.7NEHgB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1123
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/575a2a39-740d-e24f-3e24-f1693f0bd3d5@web.de
Resent-Date: Thu,  4 Feb 2021 18:56:59 +0000 (UTC)

> Replace the following two statements by the statement =E2=80=9Cgoto put_=
nbd;=E2=80=9D
=E2=80=A6
> Signed-off-by: Sun Ke <sunke32@huawei.com>

Will the tag =E2=80=9CSuggested-by=E2=80=9D become relevant here?
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Do=
cumentation/process/submitting-patches.rst?id=3D5c279c4cf206e03995e04fd340=
4fa95ffd243a97#n545

Regards,
Markus


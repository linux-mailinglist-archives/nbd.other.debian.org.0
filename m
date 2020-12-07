Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id F3A242D0D2C
	for <lists+nbd@lfdr.de>; Mon,  7 Dec 2020 10:39:09 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id D5D6E2017D; Mon,  7 Dec 2020 09:39:09 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon Dec  7 09:39:09 2020
Old-Return-Path: <diego.sanchez@boldwhite24.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: *
X-Spam-Status: No, score=1.7 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,ONEWORD autolearn=no autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id E0AA0202A1
	for <lists-other-nbd@bendel.debian.org>; Mon,  7 Dec 2020 09:22:01 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=3.801 tagged_above=-10000 required=5.3
	tests=[DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
	DKIM_VALID_EF=-0.1, FSL_BULK_SIG=0.001, ONEWORD=2, PYZOR_CHECK=2]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id xy2HHx8mllVI for <lists-other-nbd@bendel.debian.org>;
	Mon,  7 Dec 2020 09:21:57 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.6
X-Greylist: delayed 570 seconds by postgrey-1.36 at bendel; Mon, 07 Dec 2020 09:21:57 UTC
Received: from mail.boldwhite24.com (mail.boldwhite24.com [80.211.42.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 9CD9C20296
	for <nbd@other.debian.org>; Mon,  7 Dec 2020 09:21:57 +0000 (UTC)
Received: by mail.boldwhite24.com (Postfix, from userid 1001)
	id 4489DA3ABC; Mon,  7 Dec 2020 09:11:10 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=boldwhite24.com;
	s=mail; t=1607332287;
	bh=hS3ibs4caZkahrzgcMN2TAJo2B2H5Muwb2NidDYlIzQ=;
	h=Date:From:To:Subject:From;
	b=rv8irMcvuDB+GQUkqtwh+gKTnQGfCh1/Epp8ovETkmC8MRY0ITI+nynhdKAXa96J8
	 nCgfHd9+uCdNHdzh8WQ7dBPXVGT4XFXjGPu3nw2/cl97Qy8M/UGVIJQuDTbwGs96Ev
	 C3yAs9WndRQcNegaEfAENlQmY5r/gwkyS7Ls186Ndb4fChdSA6cUQO2jmz4vC0AezH
	 Zm6uvxLzLMnERsd0jHXbBYYbQit3+AfTxcQTvqRn1VSAz4Vd2HsVzXiZZeDhsWrpV2
	 rLeVoApCjSZCAvggcuS8iJmSauTcxyYhSzmE4qmsXVXC0Z+jBN5dLe9DXR+hP1i7Rg
	 RJdDJgzPQWb0g==
Received: by mail.boldwhite24.com for <nbd@other.debian.org>; Mon,  7 Dec 2020 09:10:54 GMT
Message-ID: <20201207074500-0.1.2o.b2c0.0.j83vjft2vw@boldwhite24.com>
Date: Mon,  7 Dec 2020 09:10:54 GMT
From: =?UTF-8?Q?"Diego_S=C3=A1nchez"?= <diego.sanchez@boldwhite24.com>
To: <nbd@other.debian.org>
Subject: Disinfection
X-Mailer: mail.boldwhite24.com
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <zBr5r_1MFgJ.A.t9E.9gfzfB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1100
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20201207074500-0.1.2o.b2c0.0.j83vjft2vw@boldwhite24.com
Resent-Date: Mon,  7 Dec 2020 09:39:09 +0000 (UTC)

Good morning,

looking for companies interested in raising additional capital by diversi=
fying their offer in soaps, liquids and gels for hand disinfection and co=
smetics for body and hair care.

The distribution of innovative products corresponding to the current pref=
erences of customers in the field of hygiene and preventive healthcare al=
lows our partners to gain new markets and achieve better economic results=
=2E

In addition to products with bactericidal action, our range includes show=
er gels, shampoos and hair conditioners, as well as efficient, concentrat=
ed detergents.

The versatility (suitable for all skin types) combined with an affordable=
 price means that customers make an informed choice of a product among ot=
hers available on the market.

Are you interested in cooperation?

Diego S=C3=A1nchez


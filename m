Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id DB4A64A5010
	for <lists+nbd@lfdr.de>; Mon, 31 Jan 2022 21:23:47 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 95499201AF; Mon, 31 Jan 2022 20:23:47 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon Jan 31 20:23:47 2022
Old-Return-Path: <folkert@vanheusden.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	LDOSUBSCRIBER,LDO_WHITELIST,ONEWORD,RCVD_IN_DNSWL_LOW,
	RCVD_IN_MSPIKE_H2,T_SCC_BODY_TEXT_LINE autolearn=unavailable
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 41DB8201A7
	for <lists-other-nbd@bendel.debian.org>; Mon, 31 Jan 2022 20:23:39 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-5.701 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	LDO_WHITELIST=-5, ONEWORD=2, RCVD_IN_DNSWL_LOW=-0.7,
	RCVD_IN_MSPIKE_H2=-0.001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id pTC7iW7QDN_o for <lists-other-nbd@bendel.debian.org>;
	Mon, 31 Jan 2022 20:23:35 +0000 (UTC)
X-policyd-weight: using cached result; rate: -3.5
X-Greylist: delayed 665 seconds by postgrey-1.36 at bendel; Mon, 31 Jan 2022 20:23:35 UTC
Received: from ewsoutbound.kpnmail.nl (ewsoutbound.kpnmail.nl [195.121.94.186])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 03C8A20153
	for <nbd@other.debian.org>; Mon, 31 Jan 2022 20:23:34 +0000 (UTC)
X-KPN-MessageId: 1b9ac062-82d2-11ec-a506-00505699b430
Received: from smtp.kpnmail.nl (unknown [10.31.155.8])
	by ewsoutbound.so.kpn.org (Halon) with ESMTPS
	id 1b9ac062-82d2-11ec-a506-00505699b430;
	Mon, 31 Jan 2022 21:12:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=kpnmail.nl; s=kpnmail01;
	h=content-type:mime-version:message-id:subject:to:from:date;
	bh=u7dKTimQEnDeoU6utpTqr48pf9fnKyh8qzQb+IBTnI4=;
	b=a19ElBAtc0TQbyElfrgY2wqqmHsbM+r1ie4vD9sHqDs1VUY7LF/L2JCg2TG4/+d1VM+6/FQnMkmcl
	 mfkumvzr8ZUl+AbRPoGo6NARpWm6vrv6K+4c8E+mlYyIW8Yx2jwJSVZXHx7tQK15Qa5hijJ0nWa3rp
	 RGyOUoWrcguHZ30w=
X-KPN-VerifiedSender: No
X-CMASSUN: 33|LeLfw/xb7vsw+8BXH/Mk7LaEsnaZXQ5vgRnvi4XGMakq2eZPKkqK1vMBs7yGm3R
 QMxrCK4QfMoGpsRrfitgwJw==
X-Originating-IP: 80.100.101.20
Received: from keetweej.vanheusden.com (keetweej.vanheusden.com [80.100.101.20])
	by smtp.xs4all.nl (Halon) with ESMTPSA
	id 1c8e6c2d-82d2-11ec-ab3c-00505699d6e5;
	Mon, 31 Jan 2022 21:12:27 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by keetweej.vanheusden.com (Postfix) with ESMTP id 7DB35162210
	for <nbd@other.debian.org>; Mon, 31 Jan 2022 21:12:27 +0100 (CET)
Received: from keetweej.vanheusden.com ([127.0.0.1])
	by localhost (mauer.intranet.vanheusden.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rLe5HLvUmw9A for <nbd@other.debian.org>;
	Mon, 31 Jan 2022 21:12:26 +0100 (CET)
Received: from belle.intranet.vanheusden.com (belle.intranet.vanheusden.com [192.168.64.100])
	by keetweej.vanheusden.com (Postfix) with ESMTP id 7BAFA1621B9
	for <nbd@other.debian.org>; Mon, 31 Jan 2022 21:12:26 +0100 (CET)
Received: by belle.intranet.vanheusden.com (Postfix, from userid 1000)
	id 6EA4716026E; Mon, 31 Jan 2022 21:12:26 +0100 (CET)
Date: Mon, 31 Jan 2022 21:12:26 +0100
From: folkert <folkert@vanheusden.com>
To: nbd@other.debian.org
Subject: compression
Message-ID: <20220131201226.GO546555@belle.intranet.vanheusden.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Reply-By: Sun 16 Jan 2022 05:32:26 PM CET
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <UrIFfPZQbqL.A.k5.TVE-hB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1709
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20220131201226.GO546555@belle.intranet.vanheusden.com
Resent-Date: Mon, 31 Jan 2022 20:23:47 +0000 (UTC)

Hi,

Has it been considered to add compression to NBD?
E.g. for slow connections.

The command-structure of nbd_cmd_write could get a flag that indicates
that the data is compressed.
The length field would then be of course the compressed size. During
session setup a compression-scheme could be negotiated. I would suggest
LZO or comparable.


regards


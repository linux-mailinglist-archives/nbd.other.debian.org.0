Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id B15459469D8
	for <lists+nbd@lfdr.de>; Sat,  3 Aug 2024 15:18:59 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 8D4DB20660; Sat,  3 Aug 2024 13:18:59 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Sat Aug  3 13:18:59 2024
Old-Return-Path: <w@uter.be>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FOURLA,LDOSUBSCRIBER,LDO_WHITELIST
	autolearn=unavailable autolearn_force=no version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 48FA920659
	for <lists-other-nbd@bendel.debian.org>; Sat,  3 Aug 2024 13:18:51 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-7.1 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1, LDO_WHITELIST=-5]
	autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id X_70O8SmJJUk for <lists-other-nbd@bendel.debian.org>;
	Sat,  3 Aug 2024 13:18:45 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.6
Received: from lounge.grep.be (lounge.grep.be [IPv6:2a01:4f8:200:91e8::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 7FEA92065B
	for <nbd@other.debian.org>; Sat,  3 Aug 2024 13:18:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=uter.be;
	s=2021.lounge; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=9cC1egtmn/Lo8zik2HWOOWN9Ibmq25pzFz70kK2mYPg=; b=kpaGVmEt92stLE4IdfE+OhScV+
	96iWXZMkO4t90N3wlZu9QEdI74Bq34Kl0fZd0bEw/rFEyYoAXTy80naMds8q0iieI/ByzOexfHi25
	MA95/NnwRbNDdVhYNSZf7+rkyZxRanFqkJO4c+7PWuajNi/bTBJraP9EDFJJa6RzBUw0N0No/RTub
	r5mePISWk1FLPdK9riJFllF3GgJ4p9NzmkOtD/EZP4nNiQZ2xLSvUknBv3mJajavTiXukPMxpHVoT
	D+a8Eq8a/q8QkmrSjZUzeLKKFYj/hdjVABHA+hhXFKZdAc7L0jry8L8J+xJ7ezCXkLyhPZjhGogfk
	X1G6NdOA==;
Received: from [102.39.154.62] (helo=pc220518)
	by lounge.grep.be with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <w@uter.be>)
	id 1saEeg-00Chc8-38;
	Sat, 03 Aug 2024 15:18:42 +0200
Received: from wouter by pc220518 with local (Exim 4.98)
	(envelope-from <w@uter.be>)
	id 1saEeZ-000000001uG-3qBA;
	Sat, 03 Aug 2024 15:18:35 +0200
Date: Sat, 3 Aug 2024 15:18:35 +0200
From: Wouter Verhelst <w@uter.be>
To: Eric Blake <eblake@redhat.com>
Cc: nbd@other.debian.org, qemu-devel@nongnu.org
Subject: Re: [PATCH] docs: Tweak location of qemu nbd extensions
Message-ID: <Zq4uK9Z6GX7Ga-qY@pc220518.home.grep.be>
References: <20240802133811.2001029-1-eblake@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240802133811.2001029-1-eblake@redhat.com>
X-Speed: Gates' Law: Every 18 months, the speed of software halves.
Organization: none
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <ObSdXs-q0KK.A.sTPC.D5irmB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/3118
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/Zq4uK9Z6GX7Ga-qY@pc220518.home.grep.be
Resent-Date: Sat,  3 Aug 2024 13:18:59 +0000 (UTC)

On Fri, Aug 02, 2024 at 08:36:43AM -0500, Eric Blake wrote:
> Upstream QEMU is moving the location of its NBD docs, as of its commit
> XXXX[1].  Instead of pointing to the raw git source file, point to the
> rendered html version built from rST.

ACK. Please push as soon as that lands.

-- 
     w@uter.{be,co.za}
wouter@{grep.be,fosdem.org,debian.org}

I will have a Tin-Actinium-Potassium mixture, thanks.


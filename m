Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AD0D6E62A2
	for <lists+nbd@lfdr.de>; Tue, 18 Apr 2023 14:34:17 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 3BC9620C26; Tue, 18 Apr 2023 12:34:17 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Apr 18 12:34:17 2023
Old-Return-Path: <w@uter.be>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,LDOSUBSCRIBER,LDO_WHITELIST,LONGWORD,
	MURPHY_DRUGS_REL8,T_SCC_BODY_TEXT_LINE autolearn=unavailable
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id BBCDE20C0C
	for <lists-other-nbd@bendel.debian.org>; Tue, 18 Apr 2023 12:34:06 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-5.18 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, LDO_WHITELIST=-5, LONGWORD=2,
	MURPHY_DRUGS_REL8=0.02] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id sbAfBRCDVQpI for <lists-other-nbd@bendel.debian.org>;
	Tue, 18 Apr 2023 12:33:59 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -4.6
Received: from lounge.grep.be (lounge.grep.be [IPv6:2a01:4f8:200:91e8::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id AD77520C04
	for <nbd@other.debian.org>; Tue, 18 Apr 2023 12:33:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=uter.be;
	s=2021.lounge; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=kJiti/PexGZOHY+6vyzq9nl8I/8krUz7kPsAp619StU=; b=F/E8sC9Deb6PdWaomWtMb6r61l
	miRctBaEuMgkrpKLFYVsItbUHvLjV8Mgl9qUP96YS0GUKMdCGPRsTRJ+rR1Q96n41RLJWDf31jwJJ
	2N7CKtYxpHuOCVLPrPJ2gWyhXuxVQbdfyabZASTTBenZ7SCE0chh+y1L/4Aahtf0x+qMTIkgOjStF
	JP3FHKEjmhPABj7RHxtgzTCWwxkAip80qh3BTCiqkAWdWqtHxRn+hsg9QbeiKyw+DqkOEpYU5Xz+2
	EtJdYKj0snMmY+1xYNJZQk7CENlPF9CO3hVmFrT1Ws7mB/xvC7ypRi5IoNCcX8eLVU7PJ79dtRLKc
	PnMimB5Q==;
Received: from [217.111.249.126] (helo=pc220518)
	by lounge.grep.be with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <w@uter.be>)
	id 1pokWz-00Ekju-PE; Tue, 18 Apr 2023 14:33:57 +0200
Received: from wouter by pc220518 with local (Exim 4.96)
	(envelope-from <w@uter.be>)
	id 1pokWt-000Ezm-23;
	Tue, 18 Apr 2023 14:33:51 +0200
Date: Tue, 18 Apr 2023 14:33:41 +0200
From: Wouter Verhelst <w@uter.be>
To: Eric Blake <eblake@redhat.com>
Cc: nbd@other.debian.org, qemu-block@nongnu.org, libguestfs@redhat.com
Subject: Re: [PATCH v3 6/6] RFC: spec: Introduce
 NBD_REPLY_TYPE_OFFSET_HOLE_EXT
Message-ID: <ZD6OJXoQBNJH5p4W@pc220518.home.grep.be>
References: <20230413220241.1396012-1-eblake@redhat.com>
 <20230413220241.1396012-7-eblake@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230413220241.1396012-7-eblake@redhat.com>
X-Speed: Gates' Law: Every 18 months, the speed of software halves.
Organization: none
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <26kZXLAHt2J.A.GjF.J5oPkB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2433
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/ZD6OJXoQBNJH5p4W@pc220518.home.grep.be
Resent-Date: Tue, 18 Apr 2023 12:34:17 +0000 (UTC)

On Thu, Apr 13, 2023 at 05:02:41PM -0500, Eric Blake wrote:
> Rather than requiring all servers and clients to have a 32-bit limit
> on maximum NBD_CMD_READ/WRITE sizes, we can choose to standardize
> support for a 64-bit single I/O transaction now.
> NBD_REPLY_TYPE_OFFSET_DATA can already handle a large reply, but
> NBD_REPLY_TYPE_OFFSET_HOLE needs a 64-bit counterpart.
> 
> By standardizing this, all clients must be prepared to support both
> types of hole type replies, even though most server implementations of
> extended replies are likely to only send one hole type.

I think it's probably a better idea to push this patch to a separate
"extension-*" branch, and link to that from proto.md on master. Those
are documented as "we standardized this, but no first implementor exists
yet".

If someone actually comes up with a reason for 64-bit transactions, we
can then see if the spec matches the need and merge it to master.

Otherwise this feels too much like a solution in search of a problem to
me.

With that said, for the things I didn't reply to, you can add:

Reviewed-By: Wouter Verhelst <w@uter.be>

-- 
     w@uter.{be,co.za}
wouter@{grep.be,fosdem.org,debian.org}

I will have a Tin-Actinium-Potassium mixture, thanks.


Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 639606E6226
	for <lists+nbd@lfdr.de>; Tue, 18 Apr 2023 14:30:41 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 33FAB20C0E; Tue, 18 Apr 2023 12:30:41 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Apr 18 12:30:41 2023
Old-Return-Path: <w@uter.be>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FOURLA,LDOSUBSCRIBER,LDO_WHITELIST,
	MURPHY_DRUGS_REL8,T_SCC_BODY_TEXT_LINE autolearn=unavailable
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 996D120C04
	for <lists-other-nbd@bendel.debian.org>; Tue, 18 Apr 2023 12:30:30 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-7.08 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1, LDO_WHITELIST=-5,
	MURPHY_DRUGS_REL8=0.02] autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id Rg0w0r_chkgB for <lists-other-nbd@bendel.debian.org>;
	Tue, 18 Apr 2023 12:30:27 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.6
Received: from lounge.grep.be (lounge.grep.be [IPv6:2a01:4f8:200:91e8::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 39D7920C01
	for <nbd@other.debian.org>; Tue, 18 Apr 2023 12:30:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=uter.be;
	s=2021.lounge; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=BFB1x7XxvQwzuM7F+RWxsohCuumXts8JCOzRFdpWgZg=; b=H63+RGGH0ChIqs1ojymmfb8X8c
	9zetsBNbKuXEJQf83oINPemdLObKmHjdBl80WjpeBw1SIaiOgGySpWtXM1qTw4HatymvKzl9lBdY1
	hZO4suTLYgwTS6RcDTUCQisytu+FjtbWA3aUCqu+7LWyeQq03UxwQJhXt19dMJkwCBVuiVmZ+uJfZ
	CTltlDTikGouo0ral1hfYXaV8kuVnv/vdxPh0WOc7VYxbdjtz3GN2AqTdgFdD31gJi40P8wJ5ix0Q
	G2qoG3s3wtXPk9boJNyiNvYMdmzbS7xc/TRcSU2JkSrOMG6SRSgVU2gXcB10NcX85jnj4qt/OycTN
	We4RMLQQ==;
Received: from [217.111.249.126] (helo=pc220518)
	by lounge.grep.be with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <w@uter.be>)
	id 1pokTY-00Eiq7-NZ; Tue, 18 Apr 2023 14:30:24 +0200
Received: from wouter by pc220518 with local (Exim 4.96)
	(envelope-from <w@uter.be>)
	id 1pokTS-000Ers-1n;
	Tue, 18 Apr 2023 14:30:18 +0200
Date: Tue, 18 Apr 2023 14:30:08 +0200
From: Wouter Verhelst <w@uter.be>
To: Eric Blake <eblake@redhat.com>
Cc: nbd@other.debian.org, qemu-block@nongnu.org, libguestfs@redhat.com
Subject: Re: [PATCH v3 5/6] spec: Introduce NBD_FLAG_BLOCK_STATUS_PAYLOAD
Message-ID: <ZD6NUIGVzSoInvaq@pc220518.home.grep.be>
References: <20230413220241.1396012-1-eblake@redhat.com>
 <20230413220241.1396012-6-eblake@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230413220241.1396012-6-eblake@redhat.com>
X-Speed: Gates' Law: Every 18 months, the speed of software halves.
Organization: none
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <QCk8CLudp8P.A.lLF.x1oPkB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2432
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/ZD6NUIGVzSoInvaq@pc220518.home.grep.be
Resent-Date: Tue, 18 Apr 2023 12:30:41 +0000 (UTC)

On Thu, Apr 13, 2023 at 05:02:40PM -0500, Eric Blake wrote:
[...]
> +    If extended headers were negotiated, a server MAY optionally
> +    advertise, via the transmission flag
> +    `NBD_FLAG_BLOCK_STATUS_PAYLOAD`, that it supports an alternative
> +    request form where the client sets `NBD_CMD_FLAG_PAYLOAD_LEN` in
> +    order to pass a payload that informs the server to limit its
> +    replies to the metacontext id(s) in the client's request payload,
> +    rather than giving an answer on all possible metacontext ids.  If
> +    the server does not support the payload form, or detects duplicate
> +    or unknown metacontext ids in the client's payload, the server
> +    MUST gracefully consume the client's payload before failing with
> +    `NBD_EINVAL`.  The payload form MUST occupy 8 + n*4 bytes, where n
> +    is the number of metacontext ids the client is interested in (as
> +    implied by the payload length), laid out as:
> +
> +    64 bits, effect length  
> +    n * 32 bits, list of metacontext ids to use  

This doesn't follow our usual format:

C: 64 bits, effect length
C: n * 32 bits, list of metacontext ids to use

Other than that,

Reviewed-By: Wouter Verhelst <w@uter.be>

-- 
     w@uter.{be,co.za}
wouter@{grep.be,fosdem.org,debian.org}

I will have a Tin-Actinium-Potassium mixture, thanks.


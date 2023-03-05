Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id A30016AAE9F
	for <lists+nbd@lfdr.de>; Sun,  5 Mar 2023 09:50:30 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 84C7A2081A; Sun,  5 Mar 2023 08:50:30 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Sun Mar  5 08:50:30 2023
Old-Return-Path: <w@uter.be>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FOURLA,LDOSUBSCRIBER,LDO_WHITELIST,
	MURPHY_DRUGS_REL8 autolearn=unavailable autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 1DD22205AF
	for <lists-other-nbd@bendel.debian.org>; Sun,  5 Mar 2023 08:50:20 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-7.08 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1, LDO_WHITELIST=-5,
	MURPHY_DRUGS_REL8=0.02] autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id ngAOBDf1m6wF for <lists-other-nbd@bendel.debian.org>;
	Sun,  5 Mar 2023 08:50:12 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -4.6
Received: from lounge.grep.be (lounge.grep.be [IPv6:2a01:4f8:200:91e8::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 793502058A
	for <nbd@other.debian.org>; Sun,  5 Mar 2023 08:50:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=uter.be;
	s=2021.lounge; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=Tp4pZPSq6rNgQROm93gbPxqatAHIwtyqkMWTrPcWtx8=; b=Inwd9MfClmxCwozKE0+vNUL+0q
	j8dv/8/A8DzAhtvpRwotI5gelU1g5wANzoHfqz58gMiE/NdPbwR4sIiTeQEym5En5Y1zgdAqfm/K7
	Jq2IShLUHnx/kMZiNa3n4KgrRRQLVnGN3oR/DhqLWNUp4eHEwGGCpPN07MTf7JBWTmObZTxAIic7m
	YXAWCTCYdrNtdDciJuKJQc72gjEwZCjzuDWW8dWbmRNL61yePuad3lgZTRg0Lj/wSiLcSO+PRmXju
	FsTjTSRLZC11E2017CTur+Hs9jfNGnxPX4h9FK37kHJFsaaJE7nO+PVHYBQ64d3vdJPb41N5mVrgf
	frI/Jt4g==;
Received: from [102.39.141.34] (helo=pc220518)
	by lounge.grep.be with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <w@uter.be>)
	id 1pYk4I-0007IE-3K; Sun, 05 Mar 2023 09:50:10 +0100
Received: from wouter by pc220518 with local (Exim 4.96)
	(envelope-from <w@uter.be>)
	id 1pYk4A-000Shz-2e;
	Sun, 05 Mar 2023 10:50:02 +0200
Date: Sun, 5 Mar 2023 10:50:02 +0200
From: Wouter Verhelst <w@uter.be>
To: Eric Blake <eblake@redhat.com>
Cc: nbd@other.debian.org, qemu-devel@nongnu.org, qemu-block@nongnu.org,
	libguestfs@redhat.com
Subject: Re: [PATCH v2 5/6] spec: Introduce NBD_FLAG_BLOCK_STATUS_PAYLOAD
Message-ID: <ZARXutZx3uhr0oPy@pc220518.home.grep.be>
References: <20221114224141.cm5jgyxfmvie5xb5@redhat.com>
 <20221114224655.2186173-1-eblake@redhat.com>
 <20221114224655.2186173-6-eblake@redhat.com>
 <Y/Xo+DGAYSZ4bQvK@pc220518.home.grep.be>
 <20230303224038.sxhd6enenp4v7gpa@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230303224038.sxhd6enenp4v7gpa@redhat.com>
X-Speed: Gates' Law: Every 18 months, the speed of software halves.
Organization: none
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <jbkm8na1ncF.A.H8C.WfFBkB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2351
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/ZARXutZx3uhr0oPy@pc220518.home.grep.be
Resent-Date: Sun,  5 Mar 2023 08:50:30 +0000 (UTC)

On Fri, Mar 03, 2023 at 04:40:38PM -0600, Eric Blake wrote:
> On Wed, Feb 22, 2023 at 12:05:44PM +0200, Wouter Verhelst wrote:
> > On Mon, Nov 14, 2022 at 04:46:54PM -0600, Eric Blake wrote:
> > >  #### Simple reply message
> > > 
> > > @@ -1232,6 +1235,19 @@ The field has the following format:
> > >    will be faster than a regular write). Clients MUST NOT set the
> > >    `NBD_CMD_FLAG_FAST_ZERO` request flag unless this transmission flag
> > >    is set.
> > > +- bit 12, `NBD_FLAG_BLOCK_STATUS_PAYLOAD`: Indicates that the server
> > > +  understands the use of the `NBD_CMD_FLAG_PAYLOAD_LEN` flag to
> > > +  `NBD_CMD_BLOCK_STATUS` to allow the client to request that the
> > > +  server filters its response to a specific subset of negotiated
> > > +  metacontext ids passed in via a client payload, rather than the
> > > +  default of replying to all metacontext ids. Servers MUST NOT
> > > +  advertise this bit unless the client successfully negotiates
> > > +  extended headers via `NBD_OPT_EXTENDED_HEADERS`, and SHOULD NOT
> > > +  advertise this bit in response to `NBD_OPT_EXPORT_NAME` or
> > > +  `NBD_OPT_GO` if the client does not negotiate metacontexts with
> > > +  `NBD_OPT_SET_META_CONTEXT`; clients SHOULD NOT set the
> > > +  `NBD_CMD_FLAG_PAYLOAD_LEN` flag for `NBD_CMD_BLOCK_STATUS` unless
> > > +  this transmission flag is set.
> > 
> > Given that we are introducing this at the same time as the extended
> > headers (and given that we're running out of available flags in this
> > 16-bit field), isn't it better to make the ability to understand
> > PAYLOAD_LEN be implied by extended headers? Or is there a use case for
> > implementing extended headers but not a payload length on
> > CMD_BLOCK_STATUS that I'm missing?
> 
> In my proof of implementation, this was a distinct feature addition on
> top of 64-bit headers.
> 
> It is easy to write a server that does not want to deal with a client
> payload on a block status request (for example, a server that only
> knows about one metacontext, and therefore never needs to deal with a
> client wanting a subset of negotiated metacontexts).  Forcing a server
> to have to support a client-side filtering request on block status
> commands, merely because the server now supports 64-bit lengths,
> seemed like a stretch too far, which is why I decided to use a feature
> bit for this one.

Okay, yes, that makes sense. Thanks.

-- 
     w@uter.{be,co.za}
wouter@{grep.be,fosdem.org,debian.org}

I will have a Tin-Actinium-Potassium mixture, thanks.


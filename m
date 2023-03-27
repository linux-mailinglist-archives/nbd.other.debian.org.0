Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 8855C6CA185
	for <lists+nbd@lfdr.de>; Mon, 27 Mar 2023 12:33:42 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 424FA205BC; Mon, 27 Mar 2023 10:33:42 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon Mar 27 10:33:42 2023
Old-Return-Path: <w@uter.be>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,LDOSUBSCRIBER,LDO_WHITELIST,
	MURPHY_DRUGS_REL8,ROLEX,WORD_WITHOUT_VOWELS autolearn=unavailable
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 38AE4205B8
	for <lists-other-nbd@bendel.debian.org>; Mon, 27 Mar 2023 10:33:26 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-3.18 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, LDO_WHITELIST=-5,
	MURPHY_DRUGS_REL8=0.02, ROLEX=3, WORD_WITHOUT_VOWELS=1]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id EXLJtgI615VL for <lists-other-nbd@bendel.debian.org>;
	Mon, 27 Mar 2023 10:33:18 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_FROM_MX=-3.1; rate: -4.6
Received: from lounge.grep.be (lounge.grep.be [IPv6:2a01:4f8:200:91e8::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 8475C205B4
	for <nbd@other.debian.org>; Mon, 27 Mar 2023 10:33:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=uter.be;
	s=2021.lounge; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=SfJaIhXn7l/tpdM0BEDDdyHO93VKZVbberjuCxfe2uE=; b=D8CQS8P3w0mrlmrXnqEagW18Oz
	IGvxf17fb6dKSrha/KasPSYa1C617s/sHAbiP7JKBv/3KhODLX5+g0HmuXGJc6emvaq2acSD+Z9b7
	oL2Wp+lTXbL+JW0Zw7/zs6FEeNH073jfJWJ9weH4kUkxXZUcSxFIHS8SOMTw3fwIWZq3RW2yu5OZu
	v1D4s+XzmYxi7zkQydeq+/iAvoUYb7roPEZ26XfULIsYbAPYOTpN6Qcv7Lrxhkc3IwE7iHG/XAY7J
	8Fxcj9+Z5sJ2fXiNkA/O46I4pRZlafsEq/fQxCDB92xrqACT2qouQsDTSUjaOpfdo1FXoEUte1yY5
	ZYkOC/Rg==;
Received: from vc-cpt-105-251-227-235.umts.vodacom.co.za ([105.251.227.235] helo=pc220518)
	by lounge.grep.be with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <w@uter.be>)
	id 1pgkA6-008dPU-Qt; Mon, 27 Mar 2023 12:33:14 +0200
Received: from wouter by pc220518 with local (Exim 4.96)
	(envelope-from <w@uter.be>)
	id 1pgk9y-001Bnn-12;
	Mon, 27 Mar 2023 12:33:06 +0200
Date: Mon, 27 Mar 2023 12:33:06 +0200
From: Wouter Verhelst <w@uter.be>
To: Eric Blake <eblake@redhat.com>
Cc: nbd@other.debian.org
Subject: Re: [PATCH 1/4] Refactor request handling
Message-ID: <ZCFw4gF2hsPw8IJ4@pc220518.home.grep.be>
References: <20230311130705.253855-1-w@uter.be>
 <20230311130705.253855-2-w@uter.be>
 <20230314154454.32a7dbz2jc5rmxms@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230314154454.32a7dbz2jc5rmxms@redhat.com>
X-Speed: Gates' Law: Every 18 months, the speed of software halves.
Organization: none
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <FptMEid-9kN.A.BXG.GEXIkB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2410
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/ZCFw4gF2hsPw8IJ4@pc220518.home.grep.be
Resent-Date: Mon, 27 Mar 2023 10:33:42 +0000 (UTC)

On Tue, Mar 14, 2023 at 10:44:54AM -0500, Eric Blake wrote:
> On Sat, Mar 11, 2023 at 03:07:02PM +0200, w@uter.be wrote:
> > From: Wouter Verhelst <w@uter.be>
> > 
> > Currently, the state of a request is stored on the stack, with the reply
> > being built in a buffer which is sent out at the very end of the
> > 'handle_normal_read' function.
> > 
> > This makes implementing structured replies complicated, as for those we
> > may want to sometimes send a reply chunk before that point.
> > 
> > Thus, refactor request handling such that we no longer depend on the
> > stack for sending out things.
> > 
> > Signed-off-by: Wouter Verhelst <w@uter.be>
> > ---
> >  nbd-server.c | 144 +++++++++++++++++++++++++++++++++++----------------
> >  nbdsrv.h     |   8 +++
> >  2 files changed, 106 insertions(+), 46 deletions(-)
> 
> >  /**
> >   * Read an amount of bytes at a given offset from the right file. This
> >   * abstracts the read-side of the multiple files option.
> > @@ -1310,15 +1354,20 @@ ssize_t rawexpread(off_t a, char *buf, size_t len, CLIENT *client) {
> >   * Call rawexpread repeatedly until all data has been read.
> >   * @return 0 on success, nonzero on failure
> >   **/
> > -int rawexpread_fully(off_t a, char *buf, size_t len, CLIENT *client) {
> > +int rawexpread_fully(READ_CTX *ctx, CLIENT *client) {
> >  	ssize_t ret=0;
> >  
> > -	while(len > 0 && (ret=rawexpread(a, buf, len, client)) > 0 ) {
> > -		a += ret;
> > -		buf += ret;
> > -		len -= ret;
> > +	char *buf;
> > +
> > +	while(ctx->current_len > 0) {
> > +		buf = find_read_buf(ctx);
> > +		if((ret = rawexpread((off_t)ctx->req->from + (off_t)ctx->current_offset, buf, ctx->current_len, client)) < 0) {
> > +			return ret;
> > +		}
> > +		ctx->current_offset += ret;
> > +		ctx->current_len -= ret;
> >  	}
> > -	return (ret < 0 || len != 0);
> 
> The old code looped until an error was detected or a short read occurs
> (ret == 0, len != 0).
> 
> > +	return (ret < 0 || ctx->current_len != 0);
> 
> But the new code loops only until ctx->current_len is 0 (with early
> exit on read error), making the right side of the || dead code, and
> making the loop itself busy-loop on a persistently short read.
> Quickest fix would be inserting
> 
>     if (ret == 0) break;
> 
> after the if((ret = ...)) condition, and leaving the || in the return
> untouched.

Thanks, good catch.

I've changed it to 

if((ret = rawexpread(...)) <= 0) {
	break;
}

which seems like an even better idea (and is closer to the original
behavior).

> ....
> > +++ b/nbdsrv.h
> > @@ -89,6 +89,14 @@ typedef struct {
> >  	off_t startoff;   /**< starting offset of this file */
> >  } FILE_INFO;
> >  
> > +typedef struct {
> > +	struct nbd_request *req;
> > +	char *buf;
> > +	size_t buflen;
> > +	size_t current_offset;
> 
> Should this be an off_t to begin with, or do we not care about 32-bit platforms?

current_offset holds how much of the request we have already handled,
not a file offset. In the case of simple replies (or structured replies
with DF set), the reply is built into an allocated buffer, and in that
case current_offset is used in pointer arithmetic (which implies it
needs to be a size_t, or be at least cast to that).

It's true that it isn't used in pointer arithmetics in the case of
structured replies, since there we allocate a fresh buffer every time we
get into find_read_buf. However, I still want to think of file_read_buf
as a function returning a, possibly offset, pointer into a buffer even
in that case, which also implies it should be a size_t rather than an
off_t.

Of course, in either case current_offset is *added* to a file offset in
order to find the point where we should start reading, but that is only
a secondary usage, not a primary one.

But perhaps I'm missing something?

-- 
     w@uter.{be,co.za}
wouter@{grep.be,fosdem.org,debian.org}

I will have a Tin-Actinium-Potassium mixture, thanks.


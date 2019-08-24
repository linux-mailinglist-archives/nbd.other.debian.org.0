Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id A94F59BC40
	for <lists+nbd@lfdr.de>; Sat, 24 Aug 2019 08:45:04 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 5EBA82053E; Sat, 24 Aug 2019 06:45:04 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Sat Aug 24 06:45:04 2019
Old-Return-Path: <wouter@grep.be>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,DKIM_VERIFIED,FOURLA,LDOSUBSCRIBER,
	LDO_WHITELIST,MURPHY_DRUGS_REL8 autolearn=unavailable
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 551B12046C
	for <lists-other-nbd@bendel.debian.org>; Sat, 24 Aug 2019 06:44:57 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-7.08 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1, LDO_WHITELIST=-5,
	MURPHY_DRUGS_REL8=0.02] autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id qAJ0_Kkk13_1 for <lists-other-nbd@bendel.debian.org>;
	Sat, 24 Aug 2019 06:44:53 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.6
Received: from latin.grep.be (latin.grep.be [IPv6:2a01:4f8:140:52e5::2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 3566920252
	for <nbd@other.debian.org>; Sat, 24 Aug 2019 06:44:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=grep.be;
	s=2017.latin; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=QbzStQInNB4hU8rRjd8L+RZunigs5FJZ8Dbn0BTnbJQ=; b=Mp1GXIgzLkfET1+2aVrTaZRcLR
	KVR/dALRnUaof+W4SjyubdR0p19ibFr/hl8A5oSw7c0tl0zldi8k9nMKdd6ShPKUN4/ML5siYdssB
	gL42/2Xl8NZRpuudZeD+LsK7w6cjyfIcdA3qs3Q4fJFbLA8lb5Qn1T88uW+D2HCZEhCKru67f/FXQ
	Rr9UZGUHjckumGKfPU0pogpj7bdRVnWGrNH2tt67Wxrob5npIwfxA6hO/zb/66c3kBFjJn8YfJ2x7
	svCk206ZXGDL5Fl17E5tnV5t2JT+saQf75KABfBc8NnNVfBUpAonhQUxGlfe9++HVmPNzWJ3HPyHk
	L5ZYwHkw==;
Received: from wouter by latin.grep.be with local (Exim 4.89)
	(envelope-from <wouter@grep.be>)
	id 1i1Pn6-00089I-Sk; Sat, 24 Aug 2019 08:44:48 +0200
Date: Sat, 24 Aug 2019 08:44:48 +0200
From: Wouter Verhelst <wouter@grep.be>
To: Eric Blake <eblake@redhat.com>
Cc: Wouter Verhelst <w@uter.be>, nbd@other.debian.org,
	qemu-block@nongnu.org, qemu-devel@nongnu.org, libguestfs@redhat.com
Subject: Re: [PATCH 1/1] protocol: Add NBD_CMD_FLAG_FAST_ZERO
Message-ID: <20190824064448.q62iwelqjn2safao@grep.be>
References: <25ead363-4f37-5450-b985-1876374e314d@redhat.com>
 <20190823143426.26838-1-eblake@redhat.com>
 <20190823143426.26838-2-eblake@redhat.com>
 <20190823184834.brhsfbc4sdq5xuij@grep.be>
 <d3d1590e-e276-e449-c3da-0bdc4d4977d7@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d3d1590e-e276-e449-c3da-0bdc4d4977d7@redhat.com>
X-Speed: Gates' Law: Every 18 months, the speed of software halves.
User-Agent: NeoMutt/20170113 (1.7.2)
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <DO_gSkpC9nE.A.9BE.wzNYdB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/650
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20190824064448.q62iwelqjn2safao@grep.be
Resent-Date: Sat, 24 Aug 2019 06:45:04 +0000 (UTC)

On Fri, Aug 23, 2019 at 01:58:44PM -0500, Eric Blake wrote:
> On 8/23/19 1:48 PM, Wouter Verhelst wrote:
> > On Fri, Aug 23, 2019 at 09:34:26AM -0500, Eric Blake wrote:
> >> +- bit 4, `NBD_CMD_FLAG_FAST_ZERO`; valid during
> >> +  `NBD_CMD_WRITE_ZEROES`. If set, but the server cannot perform the
> >> +  write zeroes any faster than it would for an equivalent
> >> +  `NBD_CMD_WRITE`,
> > 
> > One way of fulfilling the letter of this requirement but not its spirit
> > could be to have background writes; that is, the server makes a note
> > that the zeroed region should contain zeroes, makes an error-free reply
> > to the client, and then starts updating things in the background (with
> > proper layering so that an NBD_CMD_READ would see zeroes).
> 
> For writes, this should still be viable IF the server can also cancel
> that background write of zeroes in favor of a foreground request for
> actual data to be written to the same offset.  In other words, as long
> as the behavior to the client is "as if" there is no duplicated I/O
> cost, the zero appears fast, even if it kicked off a long-running async
> process to actually accomplish it.

That's kind of what I was thinking of, yeah.

A background write would cause disk I/O, which *will* cause any write
that happen concurrently with it to slow down. If we need to write
several orders of magnitude of zeroes, then the "fast zero" will
actually cause the following writes to slow down, which could impact
performance.

The cancelling should indeed happen (otherwise ordering of writes will
be wrong, as per the spec), but that doesn't negate the performance
impact.

> > This could negatively impact performance after that command to the
> > effect that syncing the device would be slower rather than faster, if
> > not done right.
> 
> Oh. I see - for flush requests, you're worried about the cost of the
> flush forcing the I/O for the background zero to complete before flush
> can return.
> 
> Perhaps that merely means that a client using fast zero requests as a
> means of probing whether it can do a bulk pre-zero pass even though it
> will be rewriting part of that image with data later SHOULD NOT attempt
> to flush the disk until all other interesting write requests are also
> ready to queue.  In the 'qemu-img convert' case which spawned this
> discussion, that's certainly the case (qemu-img does not call flush
> after the pre-zeroing, but only after all data is copied - and then it
> really DOES want to wait for any remaining backgrounded zeroing to land
> on the disk along with any normal writes when it does its final flush).

Not what I meant, but also a good point, thanks :)

> > Do we want to keep that in consideration?
> 
> Ideas on how best to add what I mentioned above into the specification?

Perhaps clarify that the "fast zero" flag is meant to *improve*
performance, and that it therefore should either be implemented in a way
that does in fact improve performance, or not at all?

-- 
<Lo-lan-do> Home is where you have to wash the dishes.
  -- #debian-devel, Freenode, 2004-09-22


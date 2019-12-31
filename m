Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 1163712DA28
	for <lists+nbd@lfdr.de>; Tue, 31 Dec 2019 17:11:03 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id DC6E8206BF; Tue, 31 Dec 2019 16:11:02 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Dec 31 16:11:02 2019
Old-Return-Path: <wouter@grep.be>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FOURLA,LDOSUBSCRIBER,LDO_WHITELIST
	autolearn=unavailable autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 11AD2206A6
	for <lists-other-nbd@bendel.debian.org>; Tue, 31 Dec 2019 16:10:55 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-7.1 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1, LDO_WHITELIST=-5]
	autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id UraeYpOr0rTj for <lists-other-nbd@bendel.debian.org>;
	Tue, 31 Dec 2019 16:10:50 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.6
Received: from latin.grep.be (latin.grep.be [IPv6:2a01:4f8:140:52e5::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 6CC4F2065A
	for <nbd@other.debian.org>; Tue, 31 Dec 2019 16:10:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=grep.be;
	s=2017.latin; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=Uhlh+yKwW4YCIKd0pTaevfovzexYDIN5ovgLKaLUBiA=; b=LBovhbTS6Su3dudM8ZKIL5IIth
	0k3qqZ+P/1cHLnWQLX4tJE1DOmneHEX2uV5RkK7qiiyERQNMC/iC+uAErkvOboYD/C+z42DySmY9e
	el9oRdFpxuSxOLobIVt0OCxz5o/akFfL8ABB1SM6TlKHYxxTVbl2ECpcBv0sTxcoPNkSE5DgBM04+
	3fhC3epEh1M5zT0nPd1vjqMNFH5FPrgQvvYBTgN35H4ntE1jL9GDlGSP0N94o4ogl65CWHUA9Hluj
	CoSwDJ1YSo+RqhRu2f84tlNhjexkxYXE51cT7ecGkdKpnqR4GmyWpzBgBCAJstFvYwN0/FIzZQHJx
	qNlsDzCQ==;
Received: from wouter by latin.grep.be with local (Exim 4.92)
	(envelope-from <wouter@grep.be>)
	id 1imJlX-000579-0s; Tue, 31 Dec 2019 16:49:03 +0100
Date: Tue, 31 Dec 2019 16:49:03 +0100
From: Wouter Verhelst <wouter@grep.be>
To: Nir Soffer <nsoffer@redhat.com>
Cc: qemu-block <qemu-block@nongnu.org>, nbd@other.debian.org,
	Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
	Eric Blake <eblake@redhat.com>,
	"Richard W.M. Jones" <rjones@redhat.com>
Subject: Re: Selecting meta context when calling NBD_CMD_BLOCK_STATUS
Message-ID: <20191231154854.GA24908@grep.be>
References: <CAMRbyyv23h0nCjh3b9oWAT_XGe+0=fDanbHOuAyK=QQJGPH5Yg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRbyyv23h0nCjh3b9oWAT_XGe+0=fDanbHOuAyK=QQJGPH5Yg@mail.gmail.com>
X-Speed: Gates' Law: Every 18 months, the speed of software halves.
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <oxlZE3-UWBE.A._vE.WM3CeB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/764
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20191231154854.GA24908@grep.be
Resent-Date: Tue, 31 Dec 2019 16:11:02 +0000 (UTC)

On Thu, Dec 26, 2019 at 04:29:03PM +0200, Nir Soffer wrote:
> Currently client need to use NBD_OPT_SET_META_CONTEXT during handshake to
> select the meta context it wants to get in NBD_CMD_BLOCK_STATUS.
> 
> This means that if you want to provide the option to get both
> "base:allocation" and
> "qemu:dirty-bitmap:x" using the same NBD client connection, you must
> pay for getting
> both during NBD_CMD_BLOCK_STATUS even if the user of the NBD client is not going
> to use both.

What is the problem with that?

ISTR that this issue was brought up when we defined the BLOCK_STATUS
command, but decided that (because the number of metadata contexts that
are likely to be in use during one session), the extra overhead from
having to parse more than one block status reply is not worth the
trouble of having to add the extra complexity to be able to filter it.

However, there might be something I'm missing.

> Or, you can use new client connection for getting meta context not
> that the current
> client did not select, which require server that supports multiple
> connections, and new
> handshake. This seems to be more complicated than needed.

It doesn't actually require that, unless you need to be able to write
from multiple connections without breaking data consistency.

(I'm assuming that by "new handshake" you mean "another handshake on a
new connection", rather than the newstyle handshake; you *do* need the
newstyle handshake format to be able to get to NBD_OPT_SET_META_CONTEXT,
but that's a given)

[...]
> Looking at command structure, I don't think it could be extended. We
> need to specify
> list of 32 bit context ids, so we need something like:
> 
> 32 bits, length of payload (N * 4)
> 32 bits, contex id 1
> ....
> 32 bits, context id N
> 
> But the length field of a BLOCK_STATUS command is already used to
> specify the range
> of the reply.
> 
> So maybe add a new handshake flag, NBD_OPT_EXTENDED_COMMAND. If set during
> handshake, and NBD_FLAG_EXTENDED is set, a command will support
> additional payload
> like the list of context ids.

If we're going to do this, then I'd like to use a new command rather
than an "extend this command" flag. Otherwise you eventually end up with
wanting to extend a command another time, and thus something like
NBD_OPT_EXTENDED_EXTENDED_EXTENDED_COMMAND. Ugly.

Just make it something like NBD_OPT_BLOCK_STATUS_FILTERED or so, and then
add a NBD_CMD_BLOCK_STATUS_FILTERED. The current command would remain
(returning all metadata contexts), and the _FILTERED one would have the
command structure you're suggesting.

-- 
<Lo-lan-do> Home is where you have to wash the dishes.
  -- #debian-devel, Freenode, 2004-09-22


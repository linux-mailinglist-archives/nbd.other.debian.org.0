Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 909AC6E6805
	for <lists+nbd@lfdr.de>; Tue, 18 Apr 2023 17:25:17 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 7387F20A88; Tue, 18 Apr 2023 15:25:17 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Apr 18 15:25:17 2023
Old-Return-Path: <eblake@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=4.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FOURLA,LDOSUBSCRIBER,
	LDO_WHITELIST,MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
	SARE_MSGID_LONG45,SARE_MSGID_LONG50,T_SCC_BODY_TEXT_LINE
	autolearn=unavailable autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id B812220A9D
	for <lists-other-nbd@bendel.debian.org>; Tue, 18 Apr 2023 15:25:05 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-5.463 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIMWL_WL_HIGH=-0.001, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1,
	LDO_WHITELIST=-5, MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_NONE=-0.0001,
	RCVD_IN_MSPIKE_H2=-0.001, SARE_MSGID_LONG45=0.893,
	SARE_MSGID_LONG50=0.726] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id m692jS4hp7gI for <lists-other-nbd@bendel.debian.org>;
	Tue, 18 Apr 2023 15:24:57 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by bendel.debian.org (Postfix) with ESMTP id 531B820A88
	for <nbd@other.debian.org>; Tue, 18 Apr 2023 15:24:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1681831492;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9cIcH/VfLauUHOufE8I/W4L24ZeKk87x5ZhdoSwA4p4=;
	b=KrQSnSIqgRix3VDf02WGAxizthxPm3IUD4B1u8hd7N322z/O1p2NiARDDP4OLiE45MAD0F
	YzvD4yOFAZ7/+JqjN5rpgw3BIUsU+5SQcEHaS/zDTykYKr8wF1vppvuWi+uJBV89N18xW6
	XWWaqjeNLIl5V4GrHDD/un16Tt/Vows=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-175-XpAxxGf8M0KHJ425rXGwkg-1; Tue, 18 Apr 2023 11:24:51 -0400
X-MC-Unique: XpAxxGf8M0KHJ425rXGwkg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B76A938221C5;
	Tue, 18 Apr 2023 15:24:50 +0000 (UTC)
Received: from redhat.com (unknown [10.2.16.177])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 26B45C15BA0;
	Tue, 18 Apr 2023 15:24:50 +0000 (UTC)
Date: Tue, 18 Apr 2023 10:24:48 -0500
From: Eric Blake <eblake@redhat.com>
To: Wouter Verhelst <w@uter.be>
Cc: nbd@other.debian.org, qemu-block@nongnu.org, libguestfs@redhat.com
Subject: Re: [PATCH v3 2/6] spec: Change maximum block size to maximum
 payload size
Message-ID: <lkiuoaxijqh6zmfg33qvv47s7maenwbipmjan74etvya7sb7ud@vkzm55m4fxdu>
References: <20230413220241.1396012-1-eblake@redhat.com>
 <20230413220241.1396012-3-eblake@redhat.com>
 <ZD5iUNqjxne6c5Y1@pc220518.home.grep.be>
MIME-Version: 1.0
In-Reply-To: <ZD5iUNqjxne6c5Y1@pc220518.home.grep.be>
User-Agent: NeoMutt/20230407
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <GKkBt_SPKX.A.rKH.dZrPkB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2435
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/lkiuoaxijqh6zmfg33qvv47s7maenwbipmjan74etvya7sb7ud@vkzm55m4fxdu
Resent-Date: Tue, 18 Apr 2023 15:25:17 +0000 (UTC)

On Tue, Apr 18, 2023 at 11:26:40AM +0200, Wouter Verhelst wrote:
> On Thu, Apr 13, 2023 at 05:02:37PM -0500, Eric Blake wrote:
> > Commit 9f30fedb improved the spec to allow non-payload requests like
> > NBD_CMD_TRIM that exceed any advertised maximum block size.  Take this
> > one step further by documenting that the server may use NBD_EOVERFLOW
> > as a hint to the client when a non-payload request is oversize (while
> > permitting NBD_EINVAL for back-compat), and by rewording the text to
> > explicitly call out that what is being advertised is the maximum
> > payload length, not maximum block size.  Furthermore, favor the term
> > 'maximum payload size' instead of 'maximum block size', as the real
> > limitation here is how many bytes are sent in one direction as part of
> > the command (a maximum payload size may be related to maximum block
> > size, but existing implementations of both servers and clients that
> > actually implement NBD_INFO_BLOCK_SIZE have generally been advertising
> > things like a 32M or 64M data cap, and not an underlying block size
> > constraint).
> > 
...
> > @@ -747,8 +747,8 @@ text unless the client insists on TLS.
> > 
> >  During transmission phase, several operations are constrained by the
> >  export size sent by the final `NBD_OPT_EXPORT_NAME` or `NBD_OPT_GO`,
> > -as well as by three block size constraints defined here (minimum,
> > -preferred, and maximum).
> > +as well as by three block size constraints defined here (minimum
> > +block, preferred block, and maximum payload).
> 
> I think this may be reworded as:
> 
> "as well as by three size constraint defined here"
> 
> as they're now no longer all block size constraints.
> 
> (this occurs more below)

Concur; how about squashing in:

diff --git i/doc/proto.md w/doc/proto.md
index 9098c42..7918179 100644
--- i/doc/proto.md
+++ w/doc/proto.md
@@ -409,7 +409,7 @@ cases, a server SHOULD gracefully consume *length* bytes of payload
 (even if it then replies with an `NBD_EINVAL` failure because the
 particular command was not expecting a payload), and proceed with
 the next client command.  Thus, only when *length* is used as an
-effective length will it utilize a full 64-bit value.
+effect length will it utilize a full 64-bit value.

 #### Simple reply message

@@ -841,24 +841,24 @@ exports. It is not possible to avoid downgrade attacks
 on exports which may be served either via TLS or in plain
 text unless the client insists on TLS.

-## Block size constraints
+## Size constraints

 During transmission phase, several operations are constrained by the
 export size sent by the final `NBD_OPT_EXPORT_NAME` or `NBD_OPT_GO`,
-as well as by three block size constraints defined here (minimum
+as well as by three size constraints defined here (minimum
 block, preferred block, and maximum payload).

-If a client can honour server block size constraints (as set out below
+If a client can honour server size constraints (as set out below
 and under `NBD_INFO_BLOCK_SIZE`), it SHOULD announce this during the
 handshake phase by using `NBD_OPT_GO` (and `NBD_OPT_INFO` if used) with
 an `NBD_INFO_BLOCK_SIZE` information request, and MUST use `NBD_OPT_GO`
 rather than `NBD_OPT_EXPORT_NAME` (except in the case of a fallback
 where the server did not support `NBD_OPT_INFO` or `NBD_OPT_GO`).

-A server with block size constraints other than the default SHOULD
-advertise the block size constraints during handshake phase via
+A server with size constraints other than the default SHOULD
+advertise the size constraints during handshake phase via
 `NBD_INFO_BLOCK_SIZE` in response to `NBD_OPT_INFO` or `NBD_OPT_GO`,
-and MUST do so unless it has agreed on block size constraints via out
+and MUST do so unless it has agreed on size constraints via out
 of band means.

 Some servers are able to make optimizations, such as opening files
@@ -866,11 +866,11 @@ with `O_DIRECT`, if they know that the client will obey a particular
 minimum block size, where it must fall back to safer but slower code
 if the client might send unaligned requests. For that reason, if a
 client issues an `NBD_OPT_GO` including an `NBD_INFO_BLOCK_SIZE`
-information request, it MUST abide by the block size constraints it
+information request, it MUST abide by the size constraints it
 receives. Clients MAY issue `NBD_OPT_INFO` with `NBD_INFO_BLOCK_SIZE` to
 learn the server's constraints without committing to them.

-If block size constraints have not been advertised or agreed on
+If size constraints have not been advertised or agreed on
 externally, then a server SHOULD support a default minimum block size
 of 1, a preferred block size of 2^12 (4,096), and a maximum
 payload size that is at least 2^25 (33,554,432) (even if the export
@@ -886,12 +886,12 @@ a hard disconnect) or which uses `NBD_OPT_GO` without requesting
 that do not request sizing information when the server supports
 default sizing or where sizing constraints can be agreed on
 externally.  When allowing clients that did not negotiate sizing via
-NBD, a server that enforces stricter block size constraints than the
+NBD, a server that enforces stricter size constraints than the
 defaults MUST cleanly error commands that fall outside the constraints
 without corrupting data; even so, enforcing constraints in this manner
 may limit interoperability.

-A client MAY choose to operate as if tighter block size constraints
+A client MAY choose to operate as if tighter size constraints
 had been specified (for example, even when the server advertises the
 default minimum block size of 1, a client may safely use a minimum
 block size of 2^9 (512)).
@@ -1392,13 +1392,13 @@ of the newstyle negotiation.
       `NBD_REP_INFO` replies, but a SELECTIVETLS server MAY do so if
       this is a TLS-only export.
     - `NBD_REP_ERR_BLOCK_SIZE_REQD`: The server requires the client to
-      request block size constraints using `NBD_INFO_BLOCK_SIZE` prior
+      request size constraints using `NBD_INFO_BLOCK_SIZE` prior
       to entering transmission phase, because the server will be using
       non-default block sizes constraints. The server MUST NOT send this
-      error if block size constraints were requested with
+      error if size constraints were requested with
       `NBD_INFO_BLOCK_SIZE` with the `NBD_OPT_INFO` or `NBD_OPT_GO`
       request. The server SHOULD NOT send this error if it is using
-      default block size constraints or block size constraints
+      default size constraints or size constraints
       negotiated out of band. A server sending an
       `NBD_REP_ERR_BLOCK_SIZE_REQD` error SHOULD ensure it first
       sends an `NBD_INFO_BLOCK_SIZE` information reply in order
@@ -1748,15 +1748,15 @@ during option haggling in the fixed newstyle negotiation.

     * `NBD_INFO_BLOCK_SIZE` (3)

-      Represents the server's advertised block size constraints; see the
-      "Block size constraints" section for more details on what these
+      Represents the server's advertised size constraints; see the
+      "Size constraints" section for more details on what these
       values represent, and on constraints on their values.  The server
       MUST send this info if it is requested and it intends to enforce
-      block size constraints other than the defaults. After
+      size constraints other than the defaults. After
       sending this information in response to an `NBD_OPT_GO` in which
       the client specifically requested `NBD_INFO_BLOCK_SIZE`, the server
       can legitimately assume that any client that continues the session
-      will support the block size constraints supplied (note that this
+      will support the size constraints supplied (note that this
       assumption cannot be made solely on the basis of an `NBD_OPT_INFO`
       with an `NBD_INFO_BLOCK_SIZE` request, or an `NBD_OPT_GO` without
       an explicit `NBD_INFO_BLOCK_SIZE` request). The *length* MUST be 14,
@@ -2644,7 +2644,7 @@ implement the following features:
 - Servers that implement block constraints through `NBD_INFO_BLOCK_SIZE`
   and desire maximum interoperability SHOULD NOT require them.
   Similarly, clients that desire maximum interoperability SHOULD
-  implement querying for block size constraints. Since some clients
+  implement querying for size constraints. Since some clients
   default to a block size of 512 bytes, implementations desiring maximum
   interoperability MAY default to that size.
 - Clients or servers that desire interoperability with older
@@ -2652,7 +2652,7 @@ implement the following features:
   addition to `NBD_OPT_INFO` and `NBD_OPT_GO`.
 - For data safety, implementing `NBD_CMD_FLUSH` and the
   `NBD_CMD_FLAG_FUA` flag to `NBD_CMD_WRITE` is strongly recommended.
-  Clients that do not implement querying for block size constraints
+  Clients that do not implement querying for size constraints
   SHOULD abide by the rules laid out in the section "Block size
   constraints", above.
 - Servers that implement extended headers but desire interoperability

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


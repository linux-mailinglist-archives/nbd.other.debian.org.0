Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 676CF6E7286
	for <lists+nbd@lfdr.de>; Wed, 19 Apr 2023 07:06:10 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 375B120D19; Wed, 19 Apr 2023 05:06:10 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed Apr 19 05:06:10 2023
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
	by bendel.debian.org (Postfix) with ESMTP id 7F8F920D15
	for <lists-other-nbd@bendel.debian.org>; Wed, 19 Apr 2023 05:05:58 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-7.08 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1, LDO_WHITELIST=-5,
	MURPHY_DRUGS_REL8=0.02] autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id nPc-gXuclhLE for <lists-other-nbd@bendel.debian.org>;
	Wed, 19 Apr 2023 05:05:54 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -4.6
Received: from lounge.grep.be (lounge.grep.be [IPv6:2a01:4f8:200:91e8::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 0FE8820D14
	for <nbd@other.debian.org>; Wed, 19 Apr 2023 05:05:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=uter.be;
	s=2021.lounge; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	Message-ID:References:In-Reply-To:Subject:CC:To:From:Date:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=+k8n9JcNqUHq+fxssiiuR5KOQvKHTac5K5ngLll3++w=; b=LKyB/qLVTX3nEokpyyXr6PNA9/
	LACG4jjZDfFvsAf263zvMsJpaA7oqrSiv34TOOQNHiHcuw/A+CvvCzizAQl/bCwqSw4pdchEQY/Tz
	vrdrtxyvcSlwYCq9gzDC2NRYPEyt8Qgs3RGaonbw/8xGsj0SzAquKUtV4m0kLE0PbfkVgkw1SWUuC
	uAVGvcBZQF/VTEg4ymGo+TPtigE6WD5OJh28zA2OvjO7Z93oWtCQGjTDpay3AM95DHM7fxoNeK3CY
	fa3M0MN+ND1aDLZ5/158JuNgxEymy/biXzivjy/iRmV6uyGY5skaHYp9mX3/M1R46yuMBHIAii77o
	5AJGmhsw==;
Received: from dd5fb47a2.static.telenet.be ([213.251.71.162] helo=[127.0.0.1])
	by lounge.grep.be with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.94.2)
	(envelope-from <w@uter.be>)
	id 1pp00u-003qh0-3w; Wed, 19 Apr 2023 07:05:51 +0200
Date: Wed, 19 Apr 2023 07:05:46 +0200
From: Wouter Verhelst <w@uter.be>
To: nbd@other.debian.org, Eric Blake <eblake@redhat.com>
CC: qemu-block@nongnu.org, libguestfs@redhat.com
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v3_2/6=5D_spec=3A_Change_maxim?= =?US-ASCII?Q?um_block_size_to_maximum_payload_size?=
User-Agent: K-9 Mail for Android
In-Reply-To: <lkiuoaxijqh6zmfg33qvv47s7maenwbipmjan74etvya7sb7ud@vkzm55m4fxdu>
References: <20230413220241.1396012-1-eblake@redhat.com> <20230413220241.1396012-3-eblake@redhat.com> <ZD5iUNqjxne6c5Y1@pc220518.home.grep.be> <lkiuoaxijqh6zmfg33qvv47s7maenwbipmjan74etvya7sb7ud@vkzm55m4fxdu>
Message-ID: <31C7EA89-7C22-48A4-BD3F-C77A92092D09@uter.be>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <oq1wKIdsdJL.A.WeD.Cb3PkB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2439
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/31C7EA89-7C22-48A4-BD3F-C77A92092D09@uter.be
Resent-Date: Wed, 19 Apr 2023 05:06:10 +0000 (UTC)

Yes, this will work=2E

Thanks=2E

(I think I already gave Reviewed-By for this one, but you can add it if I =
didn't ;-)

Eric Blake <eblake@redhat=2Ecom> schreef op 18 april 2023 17:24:48 CEST:
>On Tue, Apr 18, 2023 at 11:26:40AM +0200, Wouter Verhelst wrote:
>> On Thu, Apr 13, 2023 at 05:02:37PM -0500, Eric Blake wrote:
>> > Commit 9f30fedb improved the spec to allow non-payload requests like
>> > NBD_CMD_TRIM that exceed any advertised maximum block size=2E  Take t=
his
>> > one step further by documenting that the server may use NBD_EOVERFLOW
>> > as a hint to the client when a non-payload request is oversize (while
>> > permitting NBD_EINVAL for back-compat), and by rewording the text to
>> > explicitly call out that what is being advertised is the maximum
>> > payload length, not maximum block size=2E  Furthermore, favor the ter=
m
>> > 'maximum payload size' instead of 'maximum block size', as the real
>> > limitation here is how many bytes are sent in one direction as part o=
f
>> > the command (a maximum payload size may be related to maximum block
>> > size, but existing implementations of both servers and clients that
>> > actually implement NBD_INFO_BLOCK_SIZE have generally been advertisin=
g
>> > things like a 32M or 64M data cap, and not an underlying block size
>> > constraint)=2E
>> >=20
>=2E=2E=2E=2E
>> > @@ -747,8 +747,8 @@ text unless the client insists on TLS=2E
>> >=20
>> >  During transmission phase, several operations are constrained by the
>> >  export size sent by the final `NBD_OPT_EXPORT_NAME` or `NBD_OPT_GO`,
>> > -as well as by three block size constraints defined here (minimum,
>> > -preferred, and maximum)=2E
>> > +as well as by three block size constraints defined here (minimum
>> > +block, preferred block, and maximum payload)=2E
>>=20
>> I think this may be reworded as:
>>=20
>> "as well as by three size constraint defined here"
>>=20
>> as they're now no longer all block size constraints=2E
>>=20
>> (this occurs more below)
>
>Concur; how about squashing in:
>
>diff --git i/doc/proto=2Emd w/doc/proto=2Emd
>index 9098c42=2E=2E7918179 100644
>--- i/doc/proto=2Emd
>+++ w/doc/proto=2Emd
>@@ -409,7 +409,7 @@ cases, a server SHOULD gracefully consume *length* by=
tes of payload
> (even if it then replies with an `NBD_EINVAL` failure because the
> particular command was not expecting a payload), and proceed with
> the next client command=2E  Thus, only when *length* is used as an
>-effective length will it utilize a full 64-bit value=2E
>+effect length will it utilize a full 64-bit value=2E
>
> #### Simple reply message
>
>@@ -841,24 +841,24 @@ exports=2E It is not possible to avoid downgrade at=
tacks
> on exports which may be served either via TLS or in plain
> text unless the client insists on TLS=2E
>
>-## Block size constraints
>+## Size constraints
>
> During transmission phase, several operations are constrained by the
> export size sent by the final `NBD_OPT_EXPORT_NAME` or `NBD_OPT_GO`,
>-as well as by three block size constraints defined here (minimum
>+as well as by three size constraints defined here (minimum
> block, preferred block, and maximum payload)=2E
>
>-If a client can honour server block size constraints (as set out below
>+If a client can honour server size constraints (as set out below
> and under `NBD_INFO_BLOCK_SIZE`), it SHOULD announce this during the
> handshake phase by using `NBD_OPT_GO` (and `NBD_OPT_INFO` if used) with
> an `NBD_INFO_BLOCK_SIZE` information request, and MUST use `NBD_OPT_GO`
> rather than `NBD_OPT_EXPORT_NAME` (except in the case of a fallback
> where the server did not support `NBD_OPT_INFO` or `NBD_OPT_GO`)=2E
>
>-A server with block size constraints other than the default SHOULD
>-advertise the block size constraints during handshake phase via
>+A server with size constraints other than the default SHOULD
>+advertise the size constraints during handshake phase via
> `NBD_INFO_BLOCK_SIZE` in response to `NBD_OPT_INFO` or `NBD_OPT_GO`,
>-and MUST do so unless it has agreed on block size constraints via out
>+and MUST do so unless it has agreed on size constraints via out
> of band means=2E
>
> Some servers are able to make optimizations, such as opening files
>@@ -866,11 +866,11 @@ with `O_DIRECT`, if they know that the client will =
obey a particular
> minimum block size, where it must fall back to safer but slower code
> if the client might send unaligned requests=2E For that reason, if a
> client issues an `NBD_OPT_GO` including an `NBD_INFO_BLOCK_SIZE`
>-information request, it MUST abide by the block size constraints it
>+information request, it MUST abide by the size constraints it
> receives=2E Clients MAY issue `NBD_OPT_INFO` with `NBD_INFO_BLOCK_SIZE` =
to
> learn the server's constraints without committing to them=2E
>
>-If block size constraints have not been advertised or agreed on
>+If size constraints have not been advertised or agreed on
> externally, then a server SHOULD support a default minimum block size
> of 1, a preferred block size of 2^12 (4,096), and a maximum
> payload size that is at least 2^25 (33,554,432) (even if the export
>@@ -886,12 +886,12 @@ a hard disconnect) or which uses `NBD_OPT_GO` witho=
ut requesting
> that do not request sizing information when the server supports
> default sizing or where sizing constraints can be agreed on
> externally=2E  When allowing clients that did not negotiate sizing via
>-NBD, a server that enforces stricter block size constraints than the
>+NBD, a server that enforces stricter size constraints than the
> defaults MUST cleanly error commands that fall outside the constraints
> without corrupting data; even so, enforcing constraints in this manner
> may limit interoperability=2E
>
>-A client MAY choose to operate as if tighter block size constraints
>+A client MAY choose to operate as if tighter size constraints
> had been specified (for example, even when the server advertises the
> default minimum block size of 1, a client may safely use a minimum
> block size of 2^9 (512))=2E
>@@ -1392,13 +1392,13 @@ of the newstyle negotiation=2E
>       `NBD_REP_INFO` replies, but a SELECTIVETLS server MAY do so if
>       this is a TLS-only export=2E
>     - `NBD_REP_ERR_BLOCK_SIZE_REQD`: The server requires the client to
>-      request block size constraints using `NBD_INFO_BLOCK_SIZE` prior
>+      request size constraints using `NBD_INFO_BLOCK_SIZE` prior
>       to entering transmission phase, because the server will be using
>       non-default block sizes constraints=2E The server MUST NOT send th=
is
>-      error if block size constraints were requested with
>+      error if size constraints were requested with
>       `NBD_INFO_BLOCK_SIZE` with the `NBD_OPT_INFO` or `NBD_OPT_GO`
>       request=2E The server SHOULD NOT send this error if it is using
>-      default block size constraints or block size constraints
>+      default size constraints or size constraints
>       negotiated out of band=2E A server sending an
>       `NBD_REP_ERR_BLOCK_SIZE_REQD` error SHOULD ensure it first
>       sends an `NBD_INFO_BLOCK_SIZE` information reply in order
>@@ -1748,15 +1748,15 @@ during option haggling in the fixed newstyle nego=
tiation=2E
>
>     * `NBD_INFO_BLOCK_SIZE` (3)
>
>-      Represents the server's advertised block size constraints; see the
>-      "Block size constraints" section for more details on what these
>+      Represents the server's advertised size constraints; see the
>+      "Size constraints" section for more details on what these
>       values represent, and on constraints on their values=2E  The serve=
r
>       MUST send this info if it is requested and it intends to enforce
>-      block size constraints other than the defaults=2E After
>+      size constraints other than the defaults=2E After
>       sending this information in response to an `NBD_OPT_GO` in which
>       the client specifically requested `NBD_INFO_BLOCK_SIZE`, the serve=
r
>       can legitimately assume that any client that continues the session
>-      will support the block size constraints supplied (note that this
>+      will support the size constraints supplied (note that this
>       assumption cannot be made solely on the basis of an `NBD_OPT_INFO`
>       with an `NBD_INFO_BLOCK_SIZE` request, or an `NBD_OPT_GO` without
>       an explicit `NBD_INFO_BLOCK_SIZE` request)=2E The *length* MUST be=
 14,
>@@ -2644,7 +2644,7 @@ implement the following features:
> - Servers that implement block constraints through `NBD_INFO_BLOCK_SIZE`
>   and desire maximum interoperability SHOULD NOT require them=2E
>   Similarly, clients that desire maximum interoperability SHOULD
>-  implement querying for block size constraints=2E Since some clients
>+  implement querying for size constraints=2E Since some clients
>   default to a block size of 512 bytes, implementations desiring maximum
>   interoperability MAY default to that size=2E
> - Clients or servers that desire interoperability with older
>@@ -2652,7 +2652,7 @@ implement the following features:
>   addition to `NBD_OPT_INFO` and `NBD_OPT_GO`=2E
> - For data safety, implementing `NBD_CMD_FLUSH` and the
>   `NBD_CMD_FLAG_FUA` flag to `NBD_CMD_WRITE` is strongly recommended=2E
>-  Clients that do not implement querying for block size constraints
>+  Clients that do not implement querying for size constraints
>   SHOULD abide by the rules laid out in the section "Block size
>   constraints", above=2E
> - Servers that implement extended headers but desire interoperability
>

--=20
Verstuurd vanaf mijn Android apparaat met K-9 Mail=2E Excuseer mijn beknop=
theid=2E


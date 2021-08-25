Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id A31313F76F7
	for <lists+nbd@lfdr.de>; Wed, 25 Aug 2021 16:16:07 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 7EED5208A9; Wed, 25 Aug 2021 14:16:02 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed Aug 25 14:16:02 2021
Old-Return-Path: <eblake@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.6 required=4.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FOURLA,LDOSUBSCRIBER,
	LDO_WHITELIST,MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2
	autolearn=unavailable autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id C50EA2086E
	for <lists-other-nbd@bendel.debian.org>; Wed, 25 Aug 2021 14:15:54 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-8.528 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIMWL_WL_HIGH=-0.747, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1,
	LDO_WHITELIST=-5, MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_LOW=-0.7,
	RCVD_IN_MSPIKE_H2=-0.001] autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id pjFjr6ig-rot for <lists-other-nbd@bendel.debian.org>;
	Wed, 25 Aug 2021 14:15:50 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .redhat. - helo: .us-smtp-delivery-124.mimecast. - helo-domain: .mimecast.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by bendel.debian.org (Postfix) with ESMTP id 0DECC208A3
	for <nbd@other.debian.org>; Wed, 25 Aug 2021 14:15:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1629900944;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=411HJWp421VgoZK0W1in9+8CSgxyhaj7ElEDTthOSCc=;
	b=DR/0yuXQ5nyc9nmCB7+9mISU3RmR+bssloJFl4yWfzwy1jWNJ9HA8c6oZdW3p9CcPHq2Q6
	YSdSKr3otm6rCr4htYfDPagNJgKg3ENd4izJZDWxWvS0ldRD/HYaXDdSYva7blKME5VesF
	FaEVACFBCiHkD5BdBw793Q+PbWhj4Dc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-2-WvEaEiHjNReXtfgmOsOivg-1; Wed, 25 Aug 2021 10:15:42 -0400
X-MC-Unique: WvEaEiHjNReXtfgmOsOivg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 07E3B9392A
	for <nbd@other.debian.org>; Wed, 25 Aug 2021 14:15:42 +0000 (UTC)
Received: from blue.redhat.com (ovpn-112-96.phx2.redhat.com [10.3.112.96])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C70C85C25A
	for <nbd@other.debian.org>; Wed, 25 Aug 2021 14:15:41 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: nbd@other.debian.org
Subject: [PATCH] spec: Clarify NBD_FLAG_ vs. MitM downgrade attack
Date: Wed, 25 Aug 2021 09:15:41 -0500
Message-Id: <20210825141541.238485-1-eblake@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <iJDrRc4ML1D.A.wUE.iClJhB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1327
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20210825141541.238485-1-eblake@redhat.com
Resent-Date: Wed, 25 Aug 2021 14:16:02 +0000 (UTC)

Codify the fact that downgrade attacks are possible not only by
manipulation of NBD_OPT_STARTTLS, but also by manipulation of the
NBD_FLAG[_C]_* handshake flags.  To ensure we don't accidentally
introduce a new MitM attack vector, we want the specification to
clearly document that controlling any new protocol changes prior to
TLS is unwise, and therefore we are unlikely to add any new handshake
flags.

Viewed from another perspective, the 16 bits for handshake flags
control the protocol used during NBD_OPT_*, but what we have with
NBD_FLAG_FIXED_NEWSTYLE is already fairly robust for future extension
(since all but NBD_OPT_EXPORT_NAME encode a length, and we've gone to
great lengths to document what servers and clients should do with
unknown requests).  Meanwhile, any extension that wants to affect the
protocol used by transmission phase, such as structured replies, is
fine waiting until after TLS is started.

The expense of an extra round trip or two during NBD_OPT_ haggling
pales in comparison to the amount of data that will go over the wire
during transmission phase; and if startup efficiency really matters,
we could add a new NBD_OPT_ that does more things in one round trip
(where the fallback is still the older one-at-a-time approach).
---
 doc/proto.md | 42 +++++++++++++++++++++++++++---------------
 1 file changed, 27 insertions(+), 15 deletions(-)

diff --git a/doc/proto.md b/doc/proto.md
index 9dd59da..8044886 100644
--- a/doc/proto.md
+++ b/doc/proto.md
@@ -663,13 +663,16 @@ or using other exports.

 If a client supports TLS, it SHOULD use `NBD_OPT_GO`
 (if the server supports it) in place
-of `NBD_OPT_EXPORT_NAME`. The reason for this is set out in
+of `NBD_OPT_EXPORT_NAME`. One reason for this is set out in
 the final paragraphs of the sections under 'FORCEDTLS'
 and 'SELECTIVETLS': this gives an opportunity for the
 server to transmit that an error going into transmission
 mode is due to the client's failure to initiate TLS,
 and the fact that the client may obtain information about
-which exports are TLS-only through `NBD_OPT_INFO`.
+which exports are TLS-only through `NBD_OPT_INFO`.  Another reason is
+that the handshake flag `NBD_FLAG_C_NO_ZEROES` can be altered by a
+MitM downgrade attack, which can cause a protocol mismatch with
+`NBD_OPT_EXPORT_NAME` but not with `NBD_OPT_GO`.

 ### Security considerations

@@ -691,18 +694,20 @@ the NBD protocol.

 There are two main dangers:

-* A Man-in-the-Middle (MitM) hijacks a session and impersonates
-  the server (possibly by proxying it) claiming not to support
-  TLS. In this manner, the client is confused into operating
-  in a plain-text manner with the MitM (with the session possibly
-  being proxied in plain-text to the server using the method
-  below).
+* A Man-in-the-Middle (MitM) hijacks a session and impersonates the
+  server (possibly by proxying it) claiming not to support TLS (for
+  example, by omitting `NBD_FLAG_FIXED_NEWSTYLE` or changing a
+  response to `NBD_OPT_STARTTLS`). In this manner, the client is
+  confused into operating in a plain-text manner with the MitM (with
+  the session possibly being proxied in plain-text to the server using
+  the method below).

-* The MitM hijacks a session and impersonates the client
-  (possibly by proxying it) claiming not to support TLS. In
-  this manner the server is confused into operating in a plain-text
-  manner with the MitM (with the session being possibly
-  proxied to the client with the method above).
+* The MitM hijacks a session and impersonates the client (possibly by
+  proxying it) claiming not to support TLS (for example, by omitting
+  `NBD_FLAG_C_FIXED_NEWSTYLE` or eliding a request for
+  `NBD_OPT_STARTTLS`). In this manner the server is confused into
+  operating in a plain-text manner with the MitM (with the session
+  being possibly proxied to the client with the method above).

 With regard to the first, any client that does not wish
 to be subject to potential downgrade attack SHOULD ensure
@@ -1000,12 +1005,18 @@ the first magic number.
   support the fixed newstyle protocol
 - bit 1, `NBD_FLAG_NO_ZEROES`; if set, and if the client replies with
   `NBD_FLAG_C_NO_ZEROES` in the client flags field, the server MUST NOT
-  send the 124 bytes of zero at the end of the negotiation.
+  send the 124 bytes of zero when the client ends negotiation with
+  `NBD_OPT_EXPORT_NAME`.

 The server MUST NOT set any other flags, and SHOULD NOT change behaviour
 unless the client responds with a corresponding flag.  The server MUST
 NOT set any of these flags during oldstyle negotiation.

+It is unlikely that additional capability flags will be defined in the
+NBD protocol since this phase is susceptible to MitM downgrade attacks
+when using TLS.  Rather, additional features are best negotiated using
+protocol options.
+
 ##### Client flags

 This field of 32 bits is sent after initial connection and after
@@ -1017,7 +1028,8 @@ receiving the handshake flags from the server.
   this isn't recommended.
 - bit 1, `NBD_FLAG_C_NO_ZEROES`; MUST NOT be set if the server did not
   set `NBD_FLAG_NO_ZEROES`. If set, the server MUST NOT send the 124
-  bytes of zeroes at the end of the negotiation.
+  bytes of zeroes when the client ends negotiation with
+  `NBD_OPT_EXPORT_NAME`.

 Clients MUST NOT set any other flags; the server MUST drop the TCP
 connection if the client sets an unknown flag, or a flag that does
-- 
2.31.1


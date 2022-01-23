Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A702497219
	for <lists+nbd@lfdr.de>; Sun, 23 Jan 2022 15:27:17 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id CB7F92051C; Sun, 23 Jan 2022 14:27:16 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Sun Jan 23 14:27:16 2022
Old-Return-Path: <dialluvioso@protonmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: *
X-Spam-Status: No, score=1.7 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,HTML_MESSAGE,
	RCVD_IN_MSPIKE_H2 autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 738F420401
	for <lists-other-nbd@bendel.debian.org>; Sun, 23 Jan 2022 14:10:31 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-0.2 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
	HTML_MESSAGE=2, RCVD_IN_MSPIKE_H2=-0.001]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id eLrcFPVRRKgN for <lists-other-nbd@bendel.debian.org>;
	Sun, 23 Jan 2022 14:10:26 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from mail-40138.protonmail.ch (mail-40138.protonmail.ch [185.70.40.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "protonmail.com", Issuer "R3" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 9228C203F6
	for <nbd@other.debian.org>; Sun, 23 Jan 2022 14:10:23 +0000 (UTC)
Date: Sun, 23 Jan 2022 14:10:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail2; t=1642947020;
	bh=o+q6g4gmJtFFpTT9h2vyqIqHaieFAb71NcvajSjbV5U=;
	h=Date:To:From:Reply-To:Subject:Message-ID:From:To:Cc;
	b=IfT3jZu3eHGgf+LhQqZ/UYy/00EiB1bBGtGES5MAdhn0iKOfhYJMGuoIfMBUOBGhj
	 0ygX9Op/r7trfPeazGcPzmuTk68jMu8ZsHbSeF0ns7oJnH+pBU7Fe/W/wEvlB7Y7tf
	 dBtYUMo/jCivS8J1Bm4YzovtQfa5lTlG1mLpTDJgrGS8kdoEHWM0mv2LtBX0IJlP3/
	 A2HUznmuCwBwqzFZPshYJ6iKw+iXaDui0xzTlhk879sqmSUEjfGYK9Hqtr3S296oWu
	 SDlA9Dua6I5Ca+IId862NMElUeNoVI3l6nTG1ntClfCoT/ZcB05FUkqKObV1o2d+K4
	 3iE63BCyGnWbQ==
To: "nbd@other.debian.org" <nbd@other.debian.org>
From: Dialluvioso <dialluvioso@protonmail.com>
Reply-To: Dialluvioso <dialluvioso@protonmail.com>
Subject: [BUG] nbd-server: Remote stack-based buffer overflow
Message-ID: <dubhYNvh2heXj7wtg2sSTwouzZOAk4uzHtra2MPWnuH2iSGKLlQphnI-jt-wH-8SKSpo2LOU7H1qz4XfRwOMhamPuYCLBydRuyhdLpL2qfk=@protonmail.com>
MIME-Version: 1.0
Content-Type: multipart/alternative;
 boundary="b1_1H0uy3PgUOhITdWncehBzoowYhSY5wxnpDrka1WViY"
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <Kc169Sqn7pO.A.veD.EXW7hB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1703
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/dubhYNvh2heXj7wtg2sSTwouzZOAk4uzHtra2MPWnuH2iSGKLlQphnI-jt-wH-8SKSpo2LOU7H1qz4XfRwOMhamPuYCLBydRuyhdLpL2qfk=@protonmail.com
Resent-Date: Sun, 23 Jan 2022 14:27:16 +0000 (UTC)

This is a multi-part message in MIME format.

--b1_1H0uy3PgUOhITdWncehBzoowYhSY5wxnpDrka1WViY
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: base64

VGhlcmUgaXMgYSByZW1vdGUgZXhwbG9pdGFibGUgc3RhY2stYmFzZWQgYnVmZmVyIG92ZXJmbG93
IGluIGxpbmUgMjI5OSBgaGFuZGxlX2luZm9gIChgbmJkLXNlcnZlci5jYCksIGZpZWxkcyBgbGVu
YCBhbmQgYG5hbWVsZW5gIGFyZW4ndCBwcm9wZXJseSBjaGVja2VkIHRoZXJlZm9yZSBgc29ja2Vk
X3JlYWRgIHdpbGwgb3ZlcmZsb3cgbG9jYWwgYnVmZmVyIGBidWZgIChtYXggc2l6ZSAxMDI0IGJ5
dGVzKS4KRm9yIHJlcHJvZHVjaW5nIHRoZSBpc3N1ZSwgeW91IG9ubHkgbmVlZCB0byBwZXJmb3Jt
IHRoZSBuZWdvdGlhdGlvbiBvZiB0aGUgcHJvdG9jb2wgYW5kIHNlbmQgYSBgTkJfT1BUX0lORk9g
IG9yIGBOQkRfT1BUX0dPYCByZXF1ZXN0IHdpdGggYSBtYWxmb3JtZWQgYGxlbmAu

--b1_1H0uy3PgUOhITdWncehBzoowYhSY5wxnpDrka1WViY
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: base64

PGRpdiBzdHlsZT0iZm9udC1mYW1pbHk6IGFyaWFsOyBmb250LXNpemU6IDE0cHg7Ij48ZGl2IHN0
eWxlPSJmb250LWZhbWlseTogYXJpYWw7IGZvbnQtc2l6ZTogMTRweDsiPjxicj48L2Rpdj48L2Rp
dj48ZGl2IHN0eWxlPSJmb250LWZhbWlseTogYXJpYWw7IGZvbnQtc2l6ZTogMTRweDsiPlRoZXJl
IGlzIGEgcmVtb3RlIGV4cGxvaXRhYmxlIHN0YWNrLWJhc2VkIGJ1ZmZlciBvdmVyZmxvdyBpbiBs
aW5lIDIyOTkgYGhhbmRsZV9pbmZvYCAoYG5iZC1zZXJ2ZXIuY2ApLCBmaWVsZHMgYGxlbmAgYW5k
IGBuYW1lbGVuYCBhcmVuJ3QgcHJvcGVybHkgY2hlY2tlZCB0aGVyZWZvcmUgYHNvY2tlZF9yZWFk
YCB3aWxsIG92ZXJmbG93IGxvY2FsIGJ1ZmZlciBgYnVmYCAobWF4IHNpemUgMTAyNCBieXRlcyku
PGJyPjwvZGl2PjxkaXYgc3R5bGU9ImZvbnQtZmFtaWx5OiBhcmlhbDsgZm9udC1zaXplOiAxNHB4
OyI+Rm9yIHJlcHJvZHVjaW5nIHRoZSBpc3N1ZSwgeW91IG9ubHkgbmVlZCB0byBwZXJmb3JtIHRo
ZSBuZWdvdGlhdGlvbiBvZiB0aGUgcHJvdG9jb2wgYW5kIHNlbmQgYSBgTkJfT1BUX0lORk9gIG9y
IGBOQkRfT1BUX0dPYCByZXF1ZXN0IHdpdGggYSBtYWxmb3JtZWQgYGxlbmAuPGJyPjwvZGl2Pjxk
aXYgc3R5bGU9ImZvbnQtZmFtaWx5OiBhcmlhbDsgZm9udC1zaXplOiAxNHB4OyI+PGJyPjwvZGl2
Pg==


--b1_1H0uy3PgUOhITdWncehBzoowYhSY5wxnpDrka1WViY--


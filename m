Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
Delivered-To: lists+nbd@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mG7rCP8VE2q67QYAu9opvQ
	(envelope-from <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>)
	for <lists+nbd@lfdr.de>; Sun, 24 May 2026 17:15:11 +0200
X-Original-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id C1BB55C2D08
	for <lists+nbd@lfdr.de>; Sun, 24 May 2026 17:15:10 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 98B2920A82; Sun, 24 May 2026 15:15:10 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Sun May 24 15:15:10 2026
Old-Return-Path: <thomas@krokinole.de>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE autolearn=no
	autolearn_force=no version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id EBD6820A64
	for <lists-other-nbd@bendel.debian.org>; Sun, 24 May 2026 14:58:13 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-1.7 tagged_above=-10000 required=5.3
	tests=[BAYES_05=-1.5, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id ZLJ7LkltJqJV for <lists-other-nbd@bendel.debian.org>;
	Sun, 24 May 2026 14:58:07 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 IX_MANITU=ERR(0) CL_IP_EQ_HELO_IP=-2 (check from: .krokinole. - helo: .mo4-p00-ob.smtp.rzone. - helo-domain: .rzone.)  FROM/MX_MATCHES_NOT_HELO(DOMAIN)=0; rate: -3.5
X-Greylist: delayed 368 seconds by postgrey-1.36 at bendel; Sun, 24 May 2026 14:58:06 UTC
Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de [85.215.255.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "*.smtp.rzone.de", Issuer "Telekom Security ServerID OV Class 2 CA" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 02911209A2
	for <nbd@other.debian.org>; Sun, 24 May 2026 14:58:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1779634314; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=dFP7LgCz2U8VrICKSToCtW2qoGadrO742NiOV2RAnG8AN/uSHBWc44vr3C4TCdWS5q
    s5iyt3/voiYj8HQJb8ZtDKmyZRXNpqcpgwmS8G44mT1rKVz0Qit6rzDPhdqZJ0FW8IEF
    JBv2881qn/33DI+Bj3bLBYIUD88WC4A4N6iwNTgJxX5la/3sb42QOTgY/SiMm9aZKOL1
    4p7S2MCvKOoFmfU0c6VaNYEjyRruZdKe37e1mn3z3zO7mwvECwRVRmUcaQUKZg2lk1wF
    gZQplP+34x7VCEKFoFEgg8asumUo+bjgrZBicVb2zxJSRxUmuKia3CU5IlBMdpXa9XJD
    +T+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1779634314;
    s=strato-dkim-0002; d=strato.com;
    h=Subject:From:To:Date:Message-ID:Cc:Date:From:Subject:Sender;
    bh=44iK/SsziNcuVkGWInQjay4hqSYyLzmd/Ev+Gj7e1QE=;
    b=d2uThwjjTFnWUa/7sLf+z3CpLI5/MyxZvD5hxIoZBadx1kk34f7HT5lOsuxIg4TfO5
    bNb2jLr+55SHqDJL+BJ8S2Mhq2rr8d9WWEHLAMz515QEikmWmbHH9T3hvfK1hxU15Wa5
    kwKbaQIXqqbNwi5rUM7qrQUaGQ6Y6hN6XkSwZpJy08Hx9/fV4L2HhLsbrvXzVv251w2l
    X9Jfqr4MuSmtdBy4KxYXfBn8CG19xJ1EtC9AYj9xqDOZ6wgSa+O09TEe0SjuFDMWpjEN
    +prLOLFYZS1EW3oM9dVPdGSJshiObR+2IfWS0TcsaAqHTpXxvMR1P3wXpzd6MLvfB4Fw
    b/Xg==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=pass header.d="krokinole.de" header.s="default" header.a="rsa-sha256"
X-RZG-CLASS-ID: mo00
X-RZG-AUTH: ":O2kGeEG7b/pS1EarRHS6h3Y1lZzDH/lufVU5OHnnEtnbsRyc+Hgq14ihauclkOii/veBRtng2d/5+RAu"
Received: from mail.krokinole.de
    by smtp.strato.de (RZmta 55.0.1 AUTH)
    with ESMTPSA id 0ecd3a24OEps18g
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate)
    for <nbd@other.debian.org>;
    Sun, 24 May 2026 16:51:54 +0200 (CEST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by sarkovy.krokinole.de (Postfix) with ESMTPA id BA6FCC1D881
	for <nbd@other.debian.org>; Sun, 24 May 2026 16:51:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 sarkovy.krokinole.de BA6FCC1D881
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=krokinole.de;
	s=default; t=1779634313;
	bh=cV6BInCWJmyPjebwQkyCnyQWvbtJs+EvijMDBOAvvGY=;
	h=Date:To:From:Subject:From;
	b=OCXlzFqc9sg6dfqE2UOYjcAlzhGr3/OAaEQ683gQuHboZ6YUr5LtP6Udcblh9Nol3
	 /E7xf1ljJImV7GscPSnHQKamA12tuU+V6LqazAharc8auS9LL+fkyCCpdx6CDEH9C5
	 kQI6SXlemG5bqMEz3puUJ0sjmLEyK3XiG/WF6vENgG20BX7qrOJ9vK7R8nG9VyIpiG
	 5eWzngv6iVYSHguuUQGOYf10SkTRYcWhAd0K7kOwkgJwlzxOM0gp7Hfk1BzRuNgbpN
	 obYs7UlERbjRAijDbKeyZWsLx5n1N678mu9w09zmpu0C6P1J7VZBt4DHLSp55YnNoc
	 Qx9fQW8BBfia6JdV6KSwKe9CE4yueXgyd1T7B1zxSH+nF6z5Ha8dtQNJIS1HprhxKm
	 se6g1MxKuF3G5jY5xp5VkDhK/QTsZTzF8upe3tXariKhe1ZfTGXitPe0jcbFQ9p/hI
	 ZcGr6IRaHz1E9c+Vcvho9CETFd3m+u9Hv4KhrfcQ6ZRfxrV281cnSIqM4noou1mSaS
	 9gDvEOR76KZogzjWHNRHgWWhAarM8mT4Eif1kaLNAXX+WrUVuvSRWjgux/SqdmpgJn
	 QxXEAVIJF8z1fHz1vi29Z9/4VlV29fR4AIhWdi8ugNf1sqJVOy/cQYnCNy3l9zaQMT
	 Uj/bCH7jFo7YYVwFaaxNPMWc=
Message-ID: <ca1ce5b0-dbe8-4809-935f-2af8e828bc10@krokinole.de>
Date: Sun, 24 May 2026 16:51:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US, de-DE
To: nbd@other.debian.org
From: =?UTF-8?Q?Thomas_K=C3=B6ller?= <thomas@krokinole.de>
Subject: Problems with client configuration
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <S0zIBcjPisK.A.l-pI.-XxEqB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/3540
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/ca1ce5b0-dbe8-4809-935f-2af8e828bc10@krokinole.de
Resent-Date: Sun, 24 May 2026 15:15:10 +0000 (UTC)
X-Spamd-Result: default: False [-1.30 / 15.00];
	ARC_ALLOW(-1.00)[strato.com:s=strato-dkim-0002:i=1];
	R_MIXED_CHARSET(0.71)[subject];
	DMARC_POLICY_ALLOW(-0.50)[krokinole.de,reject];
	R_DKIM_ALLOW(-0.20)[krokinole.de:s=default];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:nbd@other.debian.org,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[nbd=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[thomas@krokinole.de,bounce-nbd=lists@other.debian.org];
	FORWARDED(0.00)[lists-other-nbd@bendel.debian.org];
	DKIM_TRACE(0.00)[krokinole.de:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	R_SPF_NA(0.00)[no SPF record];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[thomas@krokinole.de,bounce-nbd=lists@other.debian.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:8365, ipnet:2001:41b8::/29, country:DE];
	TO_DN_NONE(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[nbd];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sarkovy:email,krokinole.de:mid,krokinole.de:dkim]
X-Rspamd-Queue-Id: C1BB55C2D08
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi,
I just started to set up a ndb server/client infrastructure for the 
first time. I think I got the server part right:

[root@sarkovy ~]# getent ahosts stratoserver.internal
fd46:1ffa:d8e0::18 STREAM stratoserver.internal
fd46:1ffa:d8e0::18 DGRAM
fd46:1ffa:d8e0::18 RAW
192.168.0.18    STREAM
192.168.0.18    DGRAM
192.168.0.18    RAW
[root@sarkovy ~]# nbd-client -l stratoserver.internal
Negotiation: ..
secdata
[root@sarkovy ~]# nbd-client -l fd46:1ffa:d8e0::18
Negotiation: ..
secdata
[root@sarkovy ~]# nbd-client -l 192.168.0.18
Negotiation: ..
secdata

Note, however, that contrary to what 'man 8 nbd-client' states ("-l    
  Ask the server for a list of available exports. If the server is 
exporting over IPv6 as well as over IPv4, this will list all exports 
twice; otherwise, it should list them all only once."), there are no 
duplications.

Next, I created a file /etc/nbdtab and tried to connect using that by 
only giving the full path of the device node as the sole argument, as 
stated in 'man 8 nbd-client'.

[root@sarkovy ~]# cat /etc/nbdtab
nbd0    stratoserver.internal    secdata
[root@sarkovy ~]# nbd-client nbd0
Negotiation: ..size = 5120MB
Error: Invalid nbd device target

Exiting.
[root@sarkovy ~]# nbd-client /dev/nbd0
Negotiation: ..size = 5120MB
Error: Invalid nbd device target

Exiting.

I then tried without /etc/nbdtab, and this finally worked:

[root@sarkovy ~]# nbd-client stratoserver.internal -name secdata /dev/nbd0
Negotiation: ..size = 5120MB
Connected /dev/nbd0

So it seems that the /etc/nbdtab stuff either does not work as described 
by the man page, or not at all.


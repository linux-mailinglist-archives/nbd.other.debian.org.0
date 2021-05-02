Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F48D370E5E
	for <lists+nbd@lfdr.de>; Sun,  2 May 2021 20:09:10 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 20A8B2036E; Sun,  2 May 2021 18:09:10 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Sun May  2 18:09:10 2021
Old-Return-Path: <raphael.ludwig@happywetter.at>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: ***
X-Spam-Status: No, score=3.4 required=4.0 tests=FOURLA,HEXHASH_WORD,
	HTML_MESSAGE,MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,WORD_WITHOUT_VOWELS autolearn=no autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id B5E6F204FA
	for <lists-other-nbd@bendel.debian.org>; Sun,  2 May 2021 17:52:11 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=2.922 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, BODY_8BITS=1.5, FOURLA=0.1, HEXHASH_WORD=1,
	HTML_MESSAGE=2, MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_LOW=-0.7,
	RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
	WORD_WITHOUT_VOWELS=1] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id QbXWhvNZkHFf for <lists-other-nbd@bendel.debian.org>;
	Sun,  2 May 2021 17:52:06 +0000 (UTC)
X-policyd-weight: using cached result; rate: -3.5
X-Greylist: delayed 900 seconds by postgrey-1.36 at bendel; Sun, 02 May 2021 17:52:06 UTC
Received: from mx01lb.world4you.com (mx01lb.world4you.com [81.19.149.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id E546F204F4
	for <nbd@other.debian.org>; Sun,  2 May 2021 17:52:06 +0000 (UTC)
Received: from [194.166.54.51] (helo=[10.0.3.54])
	by mx01lb.world4you.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94)
	(envelope-from <raphael.ludwig@happywetter.at>)
	id 1ldG1e-0006B1-Td
	for nbd@other.debian.org; Sun, 02 May 2021 19:37:03 +0200
From: Raphael Ludwig <raphael.ludwig@happywetter.at>
To: nbd@other.debian.org
Subject: [BUG] nbd-server: invalid length for trim requests
Message-ID: <7416d9c6-f9f2-b899-f3aa-85eb57cb0cc6@happywetter.at>
Date: Sun, 2 May 2021 19:37:03 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
Content-Type: multipart/alternative;
 boundary="------------4D83604B05B024506EEE0C5F"
Content-Language: en-US
X-AV-Do-Run: Yes
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <V8zBvIMOFaP.A.4CH.GrujgB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1150
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/7416d9c6-f9f2-b899-f3aa-85eb57cb0cc6@happywetter.at
Resent-Date: Sun,  2 May 2021 18:09:10 +0000 (UTC)

This is a multi-part message in MIME format.
--------------4D83604B05B024506EEE0C5F
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: base64

V2hlbiBlbmFibGluZyBUUklNIHN1cHBvcnQgZm9yIGEgYmxvY2sgZGV2aWNlLCBhIHJlcXVl
c3QgY2FuIHJlc3VsdCBpbiBhDQp3cml0ZSBiZXlvbmQgdGhlIGVuZCBvZiBzdWNoIGEgYmxv
Y2sgZGV2aWNlLCBhcyBzaG93biBpbiB0aGUgZm9sbG93aW5nDQppbiB0aGUgZm9sbG93aW5n
IGRlYnVnIG91dHB1dDoNCg0KKypoYW5kbGluZyB0cmltIHJlcXVlc3QNCsKgwqDCoCBjbGll
bnQtPmV4cG9ydHNpemXCoCA6wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAxMzQyMTc3MjgNCsKg
wqDCoCByZXEtPmZyb23CoMKgwqDCoMKgwqDCoMKgwqDCoCA6wqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIDY3MTA5ODg4DQrCoMKgwqAgY3VyLnN0YXJ0b2ZmwqDCoMKgwqDCoMKgwqAgOsKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIDANCsKgwqDCoCByZXFvZmbC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCA6wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIDY3
MTA5ODg4DQrCoMKgwqAgbmV4dC5zdGFydG9mZsKgwqDCoMKgwqDCoCA6wqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCAxMzQyMTc3MjgNCsKgwqDCoCBjdXJsZW7CoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCA6wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIDY3MTA3ODQwDQrCoMKgwqAgY3Vy
bGVuIC0gcmVxb2ZmwqDCoMKgwqAgOiAxODQ0Njc0NDA3MzcwOTU0OTU2OA0KwqDCoMKgIHJl
cS0+bGVuwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCA6wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgODM4ODYwOA0KDQpSZXF1ZXN0IHRvIHB1bmNoIGEgaG9sZSBpbiBmZD01LCBzdGFydGlu
ZyBmcm9tIDY3MTA5ODg4LCBsZW5ndGggMTg0NDY3NDQwNzM3MDk1NDk1NjgNClBlcmZvcm1l
ZCBUUklNIHJlcXVlc3QgZnJvbSA2NzEwOTg4OCB0byA4Mzg4NjA4DQoNCkFzIGEgcmVzdWx0
IG9mIHN1Y2ggYSByZXF1ZXN0IHRoZSBuYmQtc2VydmVyIHByb2Nlc3Mgd2lsbCBoYW5nIHdp
dGggMTAwJQ0KY3B1IGxvYWQgd2hpbGUgdGhlIGtlcm5lbCB3cml0ZXMgYSBsb3Qgb2Ygd2Fy
bmluZ3MgYW5kIGNhbiBub3QgYmUga2lsbGVkDQp1bnRpbCBhbGwgcmVxdWVzdHMgYXJlIGhh
bmRsZWQgYnkgdGhlIGtlcm5lbC4NCkkgdXNlZCB0aGUgZm9sbG93aW5nIHBhdGNoIHRvIG1p
dGlnYXRlIHRoZSBwcm9ibGVtIGFuZCBnZXQgdHJpbS9kaXNjYXJkDQp3b3JraW5nIGZvciBh
IHNpbXBsZSBibG9jayBkZXZpY2UgZXhwb3J0Og0KDQotLS0gbmJkc3J2LmMub2xkDQorKysg
bmJkc3J2LmMNCkBAIC0yNjgsNiArMjY4LDcgQEANCsKgwqDCoMKgIEZJTEVfSU5GTyBjdXIg
PSBnX2FycmF5X2luZGV4KGNsaWVudC0+ZXhwb3J0LCBGSUxFX0lORk8sIDApOw0KwqDCoMKg
wqAgRklMRV9JTkZPIG5leHQ7DQrCoMKgwqDCoCBpbnQgaSA9IDE7DQorwqDCoMKgIHVpbnQ2
NF90IHJlcWZyb20gPSByZXEtPmZyb207DQrCoMKgwqDCoCBkbyB7DQrCoMKgwqDCoCDCoMKg
wqAgaWYoaTxjbGllbnQtPmV4cG9ydC0+bGVuKSB7DQrCoMKgwqDCoCDCoMKgwqAgwqDCoMKg
IG5leHQgPSBnX2FycmF5X2luZGV4KGNsaWVudC0+ZXhwb3J0LCBGSUxFX0lORk8sIGkpOw0K
QEAgLTI3NSwxMyArMjc2LDE0IEBADQrCoMKgwqDCoCDCoMKgwqAgwqDCoMKgIG5leHQuZmhh
bmRsZSA9IC0xOw0KwqDCoMKgwqAgwqDCoMKgIMKgwqDCoCBuZXh0LnN0YXJ0b2ZmID0gY2xp
ZW50LT5leHBvcnRzaXplOw0KwqDCoMKgwqAgwqDCoMKgIH0NCi3CoMKgwqAgwqDCoMKgIGlm
KGN1ci5zdGFydG9mZiA8PSByZXEtPmZyb20gJiYgbmV4dC5zdGFydG9mZiAtIGN1ci5zdGFy
dG9mZiA+PSByZXEtPmxlbikgew0KLcKgwqDCoCDCoMKgwqAgwqDCoMKgIG9mZl90IHJlcW9m
ZiA9IHJlcS0+ZnJvbSAtIGN1ci5zdGFydG9mZjsNCi3CoMKgwqAgwqDCoMKgIMKgwqDCoCBv
ZmZfdCBjdXJsZW4gPSBuZXh0LnN0YXJ0b2ZmIC0gcmVxb2ZmOw0KLcKgwqDCoCDCoMKgwqAg
wqDCoMKgIG9mZl90IHJlcWxlbiA9IGN1cmxlbiAtIHJlcW9mZiA+IHJlcS0+bGVuID8gcmVx
LT5sZW4gOiBjdXJsZW4gLSByZXFvZmY7DQotwqDCoMKgIMKgwqDCoCDCoMKgwqAgcHVuY2hf
aG9sZShjdXIuZmhhbmRsZSwgcmVxb2ZmLCByZXFsZW4pOw0KK8KgwqDCoCDCoMKgwqAgaWYo
Y3VyLnN0YXJ0b2ZmIDw9IHJlcWZyb20pIHsNCivCoMKgwqAgwqDCoMKgIMKgwqDCoCB1aW50
NjRfdCBlbmTCoMKgID0gTUlOKHJlcS0+ZnJvbSArIHJlcS0+bGVuLCBuZXh0LnN0YXJ0b2Zm
KSAtIGN1ci5zdGFydG9mZjsNCivCoMKgwqAgwqDCoMKgIMKgwqDCoCB1aW50NjRfdCBzdGFy
dCA9IHJlcWZyb20gLSBjdXIuc3RhcnRvZmY7DQorwqDCoMKgIMKgwqDCoCDCoMKgwqAgdWlu
dDY0X3QgbGVuwqDCoCA9IGVuZCAtIHN0YXJ0OyANCivCoMKgwqAgwqDCoMKgIMKgwqDCoCBw
dW5jaF9ob2xlKGN1ci5maGFuZGxlLCBzdGFydCwgbGVuKTsNCsKgwqDCoMKgIMKgwqDCoCB9
DQrCoMKgwqDCoCDCoMKgwqAgY3VyID0gbmV4dDsNCivCoMKgwqAgwqDCoMKgIHJlcWZyb20g
PSBjdXIuc3RhcnRvZmY7DQrCoMKgwqDCoCDCoMKgwqAgaSsrOw0KwqDCoMKgwqAgfSB3aGls
ZShpIDwgY2xpZW50LT5leHBvcnQtPmxlbiAmJiBjdXIuc3RhcnRvZmYgPCAocmVxLT5mcm9t
ICsgcmVxLT5sZW4pKTsNCsKgwqDCoMKgIERFQlVHKCJQZXJmb3JtZWQgVFJJTSByZXF1ZXN0
IGZyb20gJWxsdSB0byAlbGx1IiwgKHVuc2lnbmVkIGxvbmcgbG9uZykgcmVxLT5mcm9tLCAo
dW5zaWduZWQgbG9uZyBsb25nKSByZXEtPmxlbik7DQoNClRoZSBwYXRjaCB3YXMgbm90IHRl
c3RlZCBhZ2FpbnN0IG11bHRpLWZpbGUgZXhwb3J0cyBvciByZXZpZXdlZCwgYnV0IEkNCnRo
b3VnaCBpdCBtaWdodCBoZWxwIGluIGZpeGluZyB0aGUgaXNzdWUuwqANCg0Kd2l0aCBraW5k
IHJlZ2FyZHMNClJhcGhhZWwNCg0K
--------------4D83604B05B024506EEE0C5F
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>

    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>When enabling TRIM support for a block device, a request can
      result in a write beyond the end of such a block device, as shown
      in the following in the following debug output:<br>
    </p>
    <pre>+*handling trim request
    client-&gt;exportsize  :            134217728
    req-&gt;from           :             67109888
    cur.startoff        :                    0
    reqoff              :             67109888
    next.startoff       :            134217728
    curlen              :             67107840
    curlen - reqoff     : 18446744073709549568
    req-&gt;len            :              8388608</pre>
    <pre>Request to punch a hole in fd=5, starting from 67109888, length 18446744073709549568
Performed TRIM request from 67109888 to 8388608</pre>
    <p>As a result of such a request the nbd-server process will hang
      with 100% cpu load while the kernel writes a lot of warnings and
      can not be killed until all requests are handled by the kernel.<br>
      I used the following patch to mitigate the problem and get
      trim/discard working for a simple block device export: <br>
    </p>
    <pre>--- nbdsrv.c.old
+++ nbdsrv.c
@@ -268,6 +268,7 @@
     FILE_INFO cur = g_array_index(client-&gt;export, FILE_INFO, 0);
     FILE_INFO next;
     int i = 1;
+    uint64_t reqfrom = req-&gt;from;
     do {
         if(i&lt;client-&gt;export-&gt;len) {
             next = g_array_index(client-&gt;export, FILE_INFO, i);
@@ -275,13 +276,14 @@
             next.fhandle = -1;
             next.startoff = client-&gt;exportsize;
         }
-        if(cur.startoff &lt;= req-&gt;from &amp;&amp; next.startoff - cur.startoff &gt;= req-&gt;len) {
-            off_t reqoff = req-&gt;from - cur.startoff;
-            off_t curlen = next.startoff - reqoff;
-            off_t reqlen = curlen - reqoff &gt; req-&gt;len ? req-&gt;len : curlen - reqoff;
-            punch_hole(cur.fhandle, reqoff, reqlen);
+        if(cur.startoff &lt;= reqfrom) {
+            uint64_t end   = MIN(req-&gt;from + req-&gt;len, next.startoff) - cur.startoff;
+            uint64_t start = reqfrom - cur.startoff;
+            uint64_t len   = end - start; 
+            punch_hole(cur.fhandle, start, len);
         }
         cur = next;
+        reqfrom = cur.startoff;
         i++;
     } while(i &lt; client-&gt;export-&gt;len &amp;&amp; cur.startoff &lt; (req-&gt;from + req-&gt;len));
     DEBUG("Performed TRIM request from %llu to %llu", (unsigned long long) req-&gt;from, (unsigned long long) req-&gt;len);

</pre>
    <p>The patch was not tested against multi-file exports or reviewed,
      but I though it might help in fixing the issue. </p>
    <p>with kind regards<br>
      Raphael<br>
    </p>
  </body>
</html>

--------------4D83604B05B024506EEE0C5F--

